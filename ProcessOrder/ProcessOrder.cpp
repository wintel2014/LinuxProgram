#include<ProcessOrder.h>
using namespace std;


int LayoutCheck()
{
    int result = (sizeof(Header_t) == sizeof(uint16_t)+sizeof(uint8_t)+sizeof(uint64_t)
                        +sizeof(uint64_t)+sizeof(uint8_t)+sizeof(uint16_t)); 
    assert(result==1);
    return result;
}




uint32_t OrderEntryMsgClass::count=0;
uint32_t OrderAckMsgClass::count=0;
uint32_t OrderFillMsgClass::count=0;
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

uint32_t ProcessOrder::TotalCnt=0;    
ProcessOrder::ProcessOrder(const char* FileName):
        StreamMap(FileName)
{
}
int ProcessOrder::LoadFile()
{
    //Max Size
    uint32_t const ContainerSize = StreamMap.GetSize()/sizeof(Header_t);
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
    VectorAckMSg_t::iterator IterAck;
    LiquidityVector_t::iterator IterLiquid;
    ActiveTraderVector_t::iterator IterActive;
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
        //Most Active
        for(IterAck=vAckMsg.begin(); IterAck!=vAckMsg.end(); IterAck++)
            if((*IterAck)->isMatchClientID((*iter)->GetClientID()) )
                break;
        // if it's not rejected
        if(IterAck!=vAckMsg.end() && (*IterAck)->Accept()) {
            ActiveTrader Active((*iter)->GetTraderTag(), (*iter)->GetQty());
            IterActive=find(ActiveVector.begin(), ActiveVector.end(), Active);
            if(IterActive != ActiveVector.end())
                IterActive->AcceptQty += Active.AcceptQty; 
            else
                ActiveVector.push_back(Active);
        }
        //Most Liquidity
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
    sort(ActiveVector.begin(), ActiveVector.end(), 
        [](const ActiveTrader &L, const ActiveTrader &R){return L.AcceptQty > R.AcceptQty;}); 
    sort(LiquidityVector.begin(), LiquidityVector.end(), 
        [](const Liquidity &L, const Liquidity &R){return L.GFDQty > R.GFDQty;}); 
    
#ifdef DEBUGV
    for_each(ClientID2OrderEntry.begin(), ClientID2OrderEntry.end(), 
            [](const ID2Entry_t::value_type &mapIter) {
                    Log("%s-->ClientId=0x%016llX\n", mapIter.second->GetTraderTag(), mapIter.first);});
#endif
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
    printf("TotalCnt=%u, EntryMsgCnt=%u, AckMsgCnt=%u, FillMsgCnt=%u ",
            TotalCnt, OrderEntryMsgClass::GetCount(),
            OrderAckMsgClass::GetCount(), OrderFillMsgClass::GetCount());

    printf("Most ActiveTrader=%s, ", ActiveVector.begin()->TraderName);
    printf("Most Liquidity=%s, ", LiquidityVector.begin()->TraderName);
#ifdef DEBUGV
    Log("\n=========================%s==============================\n", "ActiveTrader");
    for_each(ActiveVector.begin(), ActiveVector.end(), [](const ActiveTrader &A) {
            printf("%s-->%u\n", A.TraderName, A.AcceptQty);} );
    Log("=========================%s==============================\n", "Most Liquidity");
    for_each(LiquidityVector.begin(), LiquidityVector.end(), [](const Liquidity &l)
                            {printf("%s-->%u\n", l.TraderName, l.GFDQty);});
#endif
    
//Problem 5
    for_each(TradesMap.begin(), TradesMap.end(), [](const TradesPerInstrument_t::value_type &Trades)
                        {printf("%s:%lu, ",Trades.first.c_str(), Trades.second);});
    printf("\n");
    return 0;
}
