#include<iostream>
#include<string>
#include<vector>
#include<Log.h>
#include<FileOps.h>
#include<memory>
#include <assert.h>
#include <map>
#include <algorithm>
#include <functional>
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
        inline uint32_t GetQty() {return pEntryMsg->qty;}
        inline bool isGFD() {return pEntryMsg->time_in_force==GFD;}
        inline const char* GetTraderTag() {return TraderTag;}
        inline const char* GetInstrument() {return Instrument;}
        inline uint64_t GetClientID() {return pEntryMsg->client_id;}
        // const bool operator ==(const OrderEntryMsgClass&);
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
//const bool OrderEntryMsgClass::operator==(const OrderEntryMsgClass &EntryClass)
//{
//    return !strncmp(TraderTag, EntryClass.TraderTag, sizeof(TraderTag)-1);
//}
void OrderEntryMsgClass::PrintEntryMsg()
{
    Header_t *pHeader = static_cast<Header_t*>((void*) pEntryMsg);
    Log("%-10s==> Seq=0x%016llX,TimeStamp=0x%016llX Price=%d, Qty=%d, "
        "Instrument='%s' TraderTag='%s' Firm='%s' ClientID=0x%016llX  "
        "TimeInForece=%s, Side=%s, EntryMsgEnd=%p\n",  "EntryMsg",
                pHeader->Header_sequence_id,pHeader->Header_timestamp,
                pEntryMsg->price, pEntryMsg->qty, Instrument, TraderTag, Firm,
                pEntryMsg->client_id, (pEntryMsg->time_in_force==IOC)?"IOC":"GFD",
                (pEntryMsg->side==BUY)?"BUY":"SELL", (char*)GetEnd()-(char*)gMapBase);
}


class  OrderFillMsgClass; //Forward declare
class  OrderAckMsgClass:public CalcAddr{
    public:
        explicit OrderAckMsgClass(Header_t *p);
        inline void PrintAckyMsg();
        inline int Accept() {return (pAckMsg->order_status==GOOD);}
        inline uint32_t GetOrderID() {return pAckMsg->order_id;}
        inline uint64_t GetClientID() {return pAckMsg->client_id;}
        inline static size_t GetCount() {return count;}
    private:
        OrderAckMsg_t *pAckMsg;
        static size_t count;
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
        inline uint32_t GetOrderID() {return pFillMsg->order_id;}
        inline uint32_t GetFillQty() {return pFillMsg->fill_qty;}
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

class Liquidity {
    public:
        Liquidity(){}
        Liquidity(const char*Name, uint32_t qty=0):TraderName(Name),GFDQty(qty){}
        const bool operator==(const Liquidity&);
    
        const char* TraderName;
        uint32_t GFDQty;
};
const bool Liquidity::operator==(const Liquidity &Liquid)
{
    return !(strncmp(TraderName, Liquid.TraderName, 3));
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
        int ShowResult();
        // order_id == clientid??? or get the relation with AckMsg
    private:
        static size_t TotalCnt;    
        uint64_t OrderID2ClientID(uint32_t order_id) {return order_id;}
        FileOps StreamMap; 
        Header_t *mFileBase;
        VectorEntryMsg_t vEntryMsg;
        VectorAckMSg_t vAckMsg;
        VectorFillMsg_t vFillMsg;
        typedef std::map<uint64_t, shared_ptr<OrderEntryMsgClass> > ID2Entry_t;
        typedef std::map<string, uint64_t> TradesPerInstrument_t;
        typedef std::vector<Liquidity> LiquidityVector_t;
        ID2Entry_t ClientID2OrderEntry;
        LiquidityVector_t LiquidityVector;
        TradesPerInstrument_t TradesMap;
    
};

size_t ProcessOrder::TotalCnt=0;    
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
#ifdef INTEGRITY_VERIFY
        const uint64_t TerminalStr=0x4244424442444244;
        uint64_t *pTermStr=reinterpret_cast<uint64_t*>(reinterpret_cast<char*>(pHeader)-sizeof(uint64_t));
        if( *pTermStr != TerminalStr){
            LogE("Invalid TerminalString 0x%llx\n", *pTermStr);
            exit(-1);
        }
#endif
        TotalCnt++;
    }
}

int ProcessOrder::LinkFile()
{
    VectorEntryMsg_t::iterator iter;
    LiquidityVector_t::iterator IterLiquid;
    for (iter=vEntryMsg.begin(); iter!=vEntryMsg.end(); iter++) {
    #ifdef INTEGRITY_VERIFY
        uint64_t ClientIDtmp=(*iter)->GetClientID();
        ID2Entry_t::iterator iterCheck;
        iterCheck = ClientID2OrderEntry.find(ClientIDtmp);
        if(iterCheck != ClientID2OrderEntry.end()) {
            LogE("ClientID already Exist: 0x%16llX\n", ClientIDtmp);
            exit(-2);
        }
    #endif
        if((*iter)->isGFD()) {
            Liquidity Liquid((*iter)->GetTraderTag(), (*iter)->GetQty()); 
            IterLiquid=find(LiquidityVector.begin(), LiquidityVector.end(), Liquid);
            if(IterLiquid != LiquidityVector.end())
                IterLiquid->GFDQty += Liquid.GFDQty;
            else
                LiquidityVector.push_back(Liquid);
        }
            

        // MAP: CLIENTID--->OrderEntryMsg
        ClientID2OrderEntry[(*iter)->GetClientID()]=*iter;
    }
    sort(LiquidityVector.begin(), LiquidityVector.end(), 
        [](const Liquidity &L, const Liquidity &R){return L.GFDQty > R.GFDQty;}); 
    
    /*
    ID2Entry_t::iterator mapIter=ClientID2OrderEntry.begin();
    while( mapIter != ClientID2OrderEntry.end()) {
        Log("%s-->ClientId=0x%016llX\n", mapIter->second->GetTraderTag(), mapIter->first);
        mapIter++;
    }
    */
    return 0;
}

int ProcessOrder::ParseFile()
{
    VectorFillMsg_t::iterator iter;
    TradesPerInstrument_t::iterator TradesIter;
    for(iter=vFillMsg.begin(); iter!=vFillMsg.end(); iter++){
        shared_ptr<OrderEntryMsgClass> spEntry= ClientID2OrderEntry[OrderID2ClientID((*iter)->GetOrderID())];         
        Log("Parse:TraderTag=%s ClientID=0x%016llX Instrument='%s' Qty=%lu\n",spEntry->GetTraderTag(), 
            OrderID2ClientID((*iter)->GetOrderID()), spEntry->GetInstrument(), (*iter)->GetFillQty());

        string Instrument(spEntry->GetInstrument());
        TradesIter=TradesMap.find(Instrument);
        if(TradesIter != TradesMap.end())
            TradesMap[Instrument] += (*iter)->GetFillQty();
        else 
            TradesMap[Instrument]=(*iter)->GetFillQty();
    }
}

int ProcessOrder::ShowResult()
{
    Log("TotalCnt=%u, EntryMsgCnt=%u, AckMsgCnt=%u, FillMsgCnt=%u ",
            TotalCnt, OrderEntryMsgClass::GetCount(),
            OrderAckMsgClass::GetCount(), OrderFillMsgClass::GetCount());

    printf("Most Liquidity=%s ", LiquidityVector.begin()->TraderName);
#ifdef DEBUG_V
    for_each(LiquidityVector.begin(), LiquidityVector.end(), [](const Liquidity &l)
                            {printf("%s-->%u\n", l.TraderName, l.GFDQty);});
#endif
    
//Problem 5
    for_each(TradesMap.begin(), TradesMap.end(), [](const TradesPerInstrument_t::value_type &Trades)
                        {printf("%s:%lu, ",Trades.first.c_str(), Trades.second);});
    printf("\n");
    return 0;
}
int main()
{
    ProcessOrder Stream("example_data_file.bin");
    gMapBase=Stream.GetBase();
    Stream.LoadFile();
    Stream.LinkFile();
    Stream.ParseFile();
    Stream.ShowResult();
#ifdef INTEGRITY_VERIFY
    // PrintHeader(gMapBase);
    // Log("Header Packed Verify=%d\n",LayoutCheck());
#endif
    return 0;
}
