#include<iostream>
#include<string>
#include<vector>
#include<Log.h>
#include<FileOps.h>
#include<memory>
#include <assert.h>
using namespace std;

// C++ class's memory model maybe corrupt the "mmap's" layout
enum MsgType {
    OrderEntryType=1,
    OrderAckType=2,
    OrderFillType=3,
};
enum MsgDir {
    TO=0,
    FROM=1,
};

typedef struct Header {
        uint16_t Header_marker;          // this will equal "ST" in your message.
        uint8_t  Header_msg_type;        // This will be 1 = OrderEntry 2 = OrderAck 3 = OrderFill
        uint64_t Header_sequence_id;     //a complete sequence of numbers with each successive
        uint64_t Header_timestamp;        // seconds since epoch of the message.
        uint8_t  Header_msg_direction;    // 0 = to exchange 1 = from exchange.
        uint16_t Header_msg_len;         // Number of bytes in a message Body, which does NOT
}__attribute__((packed)) Header_t;
static Header_t *gMapBase;

//trader --> exchange to indicate that a trader wishes
// to buy or sell an instrument at the specified price and quantity
enum Side {
    BUY=1,
    SELL=2,
};
enum TimeInForce {
    IOC=1,
    GFD=2,
};
typedef struct OrderEntryMsg {
    Header_t Header;
    uint64_t price; // divide by 10000 to get a decimal price.
    uint32_t qty;
    char instrument[10];
    uint8_t side;               // 1 = buy 2 = sell
    uint64_t client_id; // client id.
    uint8_t time_in_force;      // 1 = immediate or cancel ﴾IOC﴿, 2 Good For Day ﴾GFD﴿
    char trader_tag[3];
    uint8_t firm_id;
    char firm[256]; // variable string [max 256 characters]﴿
    char termination_string[8];
}__attribute__((packed)) OrderEntryMsg_t; 

// exchange ---> trader  in response to an 'Order Entry Message'
// indicating if the order was accepted or rejected﴿
enum OrderStatus{
    GOOD=1,
    REJECT=2,
};
enum REJECTCODE {
    NoCode=0,
    InvalidProduct=1,
    InvalidPrice=2,
    InvalidQty=3,
};
typedef struct OrderAckMsg {
    Header_t Header;
    uint32_t order_id;
    uint64_t client_id;
    uint8_t order_status;  // 1 = good 2 = reject
    uint8_t reject_code;   // 0 = no code 1 = invalid product 2 = invalid price 3 = invalid qty
    char const termination_string[8]={0x44, 0x42, 0x44, 0x42,
                                      0x44, 0x42, 0x44, 0x42};
}__attribute__((packed)) OrderAckMsg_t;

typedef struct rptgrp {
        uint8_t firm_id;
        char trader_tag[3];
        uint32_t qty;
    }__attribute__((packed)) rptgrp_t;
typedef struct OrderFillMsg {
    Header_t Header;
    uint32_t order_id;
    uint64_t fill_price; // devide 1000 to get a decimal price
    uint32_t fill_qty;
    uint8_t no_of_contras;
    rptgrp_t repeatgroup; //Arraysize indicated by no_of_contras

    const char termination_string[8]={0x44, 0x42, 0x44, 0x42,
                                      0x44, 0x42, 0x44, 0x42};
}__attribute__((packed)) OrderFillMsg_t;

int LayoutCheck()
{
    int result = (sizeof(Header_t) == sizeof(uint16_t)+sizeof(uint8_t)+sizeof(uint64_t)
                        +sizeof(uint64_t)+sizeof(uint8_t)+sizeof(uint16_t)); 
    assert(result==1);
    return result;
}

// the address range is [Header, Msgend)
class CalcAddr {
    public:
        inline CalcAddr(Header_t *p);
        inline Header_t *GetEnd() {return static_cast<Header_t*>(MsgEnd);}
    private:
        void *MsgEnd;
};
CalcAddr::CalcAddr(Header_t *p)
{
    uint16_t MsgLen=p->Header_msg_len;
    char* MsgLenAddr=reinterpret_cast<char*>(&(p->Header_msg_len)+1);
    MsgEnd=MsgLenAddr+MsgLen; //Next Header start here!
}


class OrderEntryMsgClass:public CalcAddr {
    public:
        inline explicit OrderEntryMsgClass(Header_t *p);
        inline void PrintEntryMsg();
        inline static size_t GetCount() {return count;}
    private:
        OrderEntryMsg_t *pEntryMsg;
        char TraderTag[sizeof(OrderEntryMsg_t::trader_tag)+1];
        char Instrument[sizeof(OrderEntryMsg_t::instrument)+1];
        char Firm[257];
        static size_t count;

};
size_t OrderEntryMsgClass::count=0;
OrderEntryMsgClass::OrderEntryMsgClass(Header_t *p):
                            CalcAddr(p),
                            pEntryMsg(static_cast<OrderEntryMsg_t*>((void*)p))
{
    assert(p->Header_msg_type == OrderEntryType);
    count++;
    memset(TraderTag, 0, sizeof(TraderTag));
    memcpy(TraderTag, pEntryMsg->trader_tag, sizeof(pEntryMsg->trader_tag));
    memset(Instrument, 0, sizeof(Instrument));
    memcpy(Instrument, pEntryMsg->instrument, sizeof(pEntryMsg->instrument));
    memset(Firm, 0, sizeof(Firm));
    memcpy(Firm, pEntryMsg->firm, (reinterpret_cast<char*>(GetEnd())-sizeof(OrderEntryMsg_t::termination_string))-
                                    reinterpret_cast<char*>(pEntryMsg->firm));
    
     
    PrintEntryMsg();
}
void OrderEntryMsgClass::PrintEntryMsg()
{
    Header_t *pHeader = static_cast<Header_t*>((void*) pEntryMsg);
    Log("%-10s==> Seq=0x%016llX,TimeStamp=0x%016llX Price=%d, Qty=%d, "
        "Instrument='%s' TraderTag='%s' Firm='%s' CleintID=0x%016llX  "
        "TimeInForece=%s, Side=%s, EntryMsgEnd=%p\n",  "EntryMsg",
                pHeader->Header_sequence_id,pHeader->Header_timestamp,
                pEntryMsg->price, pEntryMsg->qty, Instrument, TraderTag, Firm,
                pEntryMsg->client_id, (pEntryMsg->time_in_force==IOC)?"IOC":"GFD",
                (pEntryMsg->side==BUY)?"BUY":"SELL", (char*)GetEnd()-(char*)gMapBase);
}


class  OrderFillMsgClass;
class  OrderAckMsgClass:public CalcAddr{
    public:
        explicit OrderAckMsgClass(Header_t *p);
        inline void PrintAckyMsg();
        inline int Accept() {return (pAckMsg->order_status==GOOD);}
        inline static size_t GetCount() {return count;}
    private:
        OrderAckMsg_t *pAckMsg;
        static size_t count;
        // AckMsg is used to communicated with Entry&Fill
        // Entry contains ClientID
        // Fill contains OrderID
        // ACK contains both, but it seems ClientID==OrderID?
        shared_ptr<OrderEntryMsgClass> spEntry;
        shared_ptr<OrderFillMsgClass>  spFill;
};
size_t OrderAckMsgClass::count=0;
OrderAckMsgClass::OrderAckMsgClass(Header_t *p):
                        CalcAddr(p),
                        pAckMsg(static_cast<OrderAckMsg_t*>((void*)p))
{
    assert(p->Header_msg_type == OrderAckType);
    count++;
    PrintAckyMsg();
}
void OrderAckMsgClass::PrintAckyMsg()
{
    Header_t *pHeader = reinterpret_cast<Header_t*>(pAckMsg);
    Log("%-10s==> Seq=0x%016llX,TimeStamp=0x%016llX OrderID=0x%08X, ClientID=0x%016llX,"
        "OrderStatus=%s AckMsgEnd=%p\n", "AckMsg",
                pHeader->Header_sequence_id,pHeader->Header_timestamp,
                pAckMsg->order_id, pAckMsg->client_id, 
                (pAckMsg->order_status==GOOD)?"GOOD":"REJECT", (char*)GetEnd()-(char*)gMapBase);
}


class  OrderFillMsgClass:public CalcAddr{
    public:
        explicit OrderFillMsgClass(Header_t *p);
        inline void PrintFillyMsg();
        inline static size_t GetCount() {return count;}
    private:
        typedef struct _group{
            uint8_t firm_id;
            char trader_tag[3+1];
            uint32_t qty;
        } _group_t;
        OrderFillMsg_t *pFillMsg;
        vector<_group_t> ContrasRptGrp;
        static size_t count;
};
size_t OrderFillMsgClass::count=0;
OrderFillMsgClass::OrderFillMsgClass(Header_t *p):
                        CalcAddr(p),
                        pFillMsg(static_cast<OrderFillMsg_t*>((void*)p))
{
    assert(p->Header_msg_type == OrderFillType);
    count++;
    ContrasRptGrp.reserve(pFillMsg->no_of_contras); 
    _group_t group;
    rptgrp_t *pRptGroup = &(pFillMsg->repeatgroup);
    for(int i=0; i<pFillMsg->no_of_contras; i++) {
        group.firm_id=pRptGroup->firm_id;
        group.qty=pRptGroup->qty;
        memset(group.trader_tag, 0, sizeof(group.trader_tag));
        memcpy(group.trader_tag, pRptGroup->trader_tag, sizeof(group.trader_tag)-1);
        ContrasRptGrp.push_back(group);
        pRptGroup++;
    }
    PrintFillyMsg();
}
void OrderFillMsgClass::PrintFillyMsg()
{
    Header_t *pHeader = static_cast<Header_t*>((void*) pFillMsg);
    Log("%-10s==> Seq=0x%016llX,TimeStamp=0x%016llX OrderID=0x%08llX, Price=%lld, "
        "Qty=%d, no_of_contras=%d ",   "FillMsg",
                pHeader->Header_sequence_id,pHeader->Header_timestamp,
                pFillMsg->order_id, pFillMsg->fill_price, pFillMsg->fill_qty,
                pFillMsg->no_of_contras);
    vector<_group_t>::iterator rptIter=ContrasRptGrp.begin();
    int index=1;
    while(rptIter != ContrasRptGrp.end()) {
        Log("[%d] FirmID=%d, TraderTag=%s, Qty=%d ", index++, 
                rptIter->firm_id, rptIter->trader_tag, rptIter->qty);
        rptIter++;
    }

    Log("  FillMsgEnd=%p \n", (char*)GetEnd()-(char*)gMapBase);
}

void  PrintHeader(Header_t *pHeader)
{
    Log("%-10s==> Maker=0x%04X, MsgType=0x%X, Seq=0x%016llX, " 
        "TimeStamp=0x%016llX, MsgDir=0x%X, MsgLen=0x%X\n", "Header",
            pHeader->Header_marker,       
            pHeader->Header_msg_type,    
            pHeader->Header_sequence_id,
            pHeader->Header_timestamp,    
            pHeader->Header_msg_direction,
            pHeader->Header_msg_len);      
}

typedef std::vector< shared_ptr<OrderEntryMsgClass> > VectorEntryMsg_t;
typedef std::vector< shared_ptr<OrderAckMsgClass> >   VectorAckMSg_t;
typedef std::vector< shared_ptr<OrderFillMsgClass> >  VectorFillMsg_t;

class ProcessOrder {
    public:
        ProcessOrder(const char *FileName);
        Header_t *GetBase() {return mFileBase;}
        int LoadFile();
        int LinkFile();
        int ParseFile();
    private:
        FileOps StreamMap; 
        Header_t *mFileBase;
        std::vector< shared_ptr<OrderEntryMsgClass> > vEntryMsg;
        std::vector< shared_ptr<OrderAckMsgClass> > vAckMsg;
        std::vector< shared_ptr<OrderFillMsgClass> > vFillMsg;
    
};

ProcessOrder::ProcessOrder(const char* FileName):
        StreamMap("example_data_file.bin")
{
}
int ProcessOrder::LoadFile()
{
    //Max Size
    size_t const ContainerSize = StreamMap.GetSize()/sizeof(Header_t);
    vEntryMsg.reserve(ContainerSize);
    vAckMsg.reserve(ContainerSize);
    vFillMsg.reserve(ContainerSize);

    Header_t *pHeader=static_cast<Header_t*>(StreamMap.GetBase());
    uint64_t TerminalStr=0x4244424442444244;
    while(pHeader < StreamMap.GetEnd()) {
        switch(pHeader->Header_msg_type) {
            case OrderEntryType:
                vEntryMsg.push_back(make_shared<OrderEntryMsgClass>(pHeader));
                break;
            case OrderAckType:
                vAckMsg.push_back(make_shared<OrderAckMsgClass>(pHeader));
                break;
            case OrderFillType:
                vFillMsg.push_back(make_shared<OrderFillMsgClass>(pHeader));
                break;
            default:
                LogE("Can't recognize the message type (%x)!!", pHeader->Header_msg_type);
                return -1;
        }
        pHeader = CalcAddr(pHeader).GetEnd();
        uint64_t *pTermStr=reinterpret_cast<uint64_t*>(reinterpret_cast<char*>(pHeader)-sizeof(uint64_t));
        if( *pTermStr != TerminalStr){
            LogE("Invalid TerminalString 0x%llx\n", *pTermStr);
            exit(-1);
        }
    }
    Log("EntryMsgCnt=%u, AckMsgCnt=%u, FillMsgCnt=%u\n", OrderEntryMsgClass::GetCount(),
            OrderAckMsgClass::GetCount(), OrderFillMsgClass::GetCount());
}

int main()
{
/*
    FileOps StreamMap("example_data_file.bin");
    Header_t *pHeader=static_cast<Header_t*>(StreamMap.GetBase());
    gMapBase=pHeader;
    std::vector< shared_ptr<OrderEntryMsgClass> > vEntryMsg;
    std::vector< shared_ptr<OrderAckMsgClass> > vAckMsg;
    std::vector< shared_ptr<OrderFillMsgClass> > vFillMsg;

    uint64_t TerminalStr=0x4244424442444244;
    while(pHeader < StreamMap.GetEnd()) {
        switch(pHeader->Header_msg_type) {
            case OrderEntryType:
                vEntryMsg.push_back(make_shared<OrderEntryMsgClass>(pHeader));
                break;
            case OrderAckType:
                vAckMsg.push_back(make_shared<OrderAckMsgClass>(pHeader));
                break;
            case OrderFillType:
                vFillMsg.push_back(make_shared<OrderFillMsgClass>(pHeader));
                break;
            default:
                LogE("Can't recognize the message type (%x)!!", pHeader->Header_msg_type);
                return -1;
        }
        pHeader = CalcAddr(pHeader).GetEnd();
        uint64_t *pTermStr=reinterpret_cast<uint64_t*>(reinterpret_cast<char*>(pHeader)-sizeof(uint64_t));
        if( *pTermStr != TerminalStr){
            LogE("Invalid TerminalString 0x%llx\n", *pTermStr);
            exit(-1);
        }
    }
    Log("EntryMsgCnt=%u, AckMsgCnt=%u, FillMsgCnt=%u\n", OrderEntryMsgClass::GetCount(),
            OrderAckMsgClass::GetCount(), OrderFillMsgClass::GetCount());
    // PrintHeader(pHeader);
    // Log("Header Packed Verify=%d\n",LayoutCheck());
*/
    ProcessOrder Stream("example_data_file.bin");
    gMapBase=Stream.GetBase();
    Stream.LoadFile();
    return 0;
}

