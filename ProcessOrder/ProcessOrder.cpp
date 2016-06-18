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
static Header_t *g_pHeader;

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
    uint64_t client_assigned_id; // client id.
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

typedef struct OrderFillMsg {
    Header_t Header;
    uint32_t order_id;
    uint64_t fill_price; // devide 1000 to get a decimal price
    uint32_t fill_qty;
    uint8_t no_of_contras;
    
    struct rptgrp {
        uint8_t firm_id;
        char trader_tag[3];
        uint32_t qty;
    }__attribute__((packed)) repeatgroup;
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
    private:
        // Header_t *pHeader;
        OrderEntryMsg_t *pEntryMsg;

};
OrderEntryMsgClass::OrderEntryMsgClass(Header_t *p):
                            CalcAddr(p),
                            pEntryMsg(static_cast<OrderEntryMsg_t*>((void*)p))
{
    assert(p->Header_msg_type == OrderEntryType);
    PrintEntryMsg();
}
void OrderEntryMsgClass::PrintEntryMsg()
{
    Header_t *pHeader = static_cast<Header_t*>((void*) pEntryMsg);
    Log("%-10s==> Seq=0x%016llX,TimeStamp=0x%016llX EntryMsgEnd=%p\n",
                "EntryMsg",
                pHeader->Header_sequence_id,pHeader->Header_timestamp,
                (char*)GetEnd()-(char*)g_pHeader);
}



class  OrderAckMsgClass:public CalcAddr{
    public:
        explicit OrderAckMsgClass(Header_t *p);
        inline void PrintAckyMsg();
    private:
        OrderAckMsg_t *pAckMsg;
        // Get the reference Order from OrderID
        shared_ptr<OrderEntryMsgClass> OrderInAck;
};
OrderAckMsgClass::OrderAckMsgClass(Header_t *p):
                        CalcAddr(p),
                        pAckMsg(static_cast<OrderAckMsg_t*>((void*)p))
{
    assert(p->Header_msg_type == OrderAckType);
    PrintAckyMsg();
}
void OrderAckMsgClass::PrintAckyMsg()
{
    Header_t *pHeader = reinterpret_cast<Header_t*>(pAckMsg);
    Log("%-10s==> Seq=0x%016llX,TimeStamp=0x%016llX OrderID=0x%08X, ClientID=0x%016llX, AckMsgEnd=%p\n",
                "AckMsg",
                pHeader->Header_sequence_id,pHeader->Header_timestamp,
                pAckMsg->order_id, pAckMsg->client_id, (char*)GetEnd()-(char*)g_pHeader);
}


class  OrderFillMsgClass:public CalcAddr{
    public:
        explicit OrderFillMsgClass(Header_t *p);
        inline void PrintFillyMsg();
    private:
        OrderFillMsg_t *pFillMsg;
        // Get the reference Order from OrderID
        shared_ptr<OrderEntryMsgClass> OrderInFill;
};
OrderFillMsgClass::OrderFillMsgClass(Header_t *p):
                        CalcAddr(p),
                        pFillMsg(static_cast<OrderFillMsg_t*>((void*)p))
{
    assert(p->Header_msg_type == OrderFillType);
    PrintFillyMsg();
}
void OrderFillMsgClass::PrintFillyMsg()
{
    Header_t *pHeader = static_cast<Header_t*>((void*) pFillMsg);
    Log("%-10s==> Seq=0x%016llX,TimeStamp=0x%016llX FillMsgEnd=%p\n",
                "FillMsg",
                pHeader->Header_sequence_id,pHeader->Header_timestamp,
                (char*)GetEnd()-(char*)g_pHeader);
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

int main()
{
    FileOps StreamMap("example_data_file.bin");
    Header_t *pHeader=static_cast<Header_t*>(StreamMap.GetBase());
    g_pHeader=pHeader;
    size_t const ContainerSize = StreamMap.GetSize()/sizeof(Header_t);
    std::vector< shared_ptr<OrderEntryMsgClass> > vEntryMsg;
    std::vector< shared_ptr<OrderAckMsgClass> > vAckMsg;
    std::vector< shared_ptr<OrderFillMsgClass> > vFillMsg;

    vEntryMsg.reserve(ContainerSize);
    vAckMsg.reserve(ContainerSize);
    vFillMsg.reserve(ContainerSize);
    shared_ptr<OrderEntryMsgClass> spEntry;
    shared_ptr<OrderAckMsgClass> spAck;
    shared_ptr<OrderFillMsgClass> spFill;
    while(pHeader < StreamMap.GetEnd()) {
        switch(pHeader->Header_msg_type) {
            case OrderEntryType:
                spEntry = make_shared<OrderEntryMsgClass>(pHeader);
                vEntryMsg.push_back(spEntry);
                break;
            case OrderAckType:
                spAck = make_shared<OrderAckMsgClass>(pHeader);
                vAckMsg.push_back(spAck);
                break;
            case OrderFillType:
                spFill = make_shared<OrderFillMsgClass>(pHeader);
                vFillMsg.push_back(spFill);
                break;
            default:
                LogE("Can't recognize the message type (%x)!!", pHeader->Header_msg_type);
                return -1;
        }
        pHeader = CalcAddr(pHeader).GetEnd();
    }
    // PrintHeader(pHeader);
    // Log("Header Packed Verify=%d\n",LayoutCheck());
    return 0;
}

