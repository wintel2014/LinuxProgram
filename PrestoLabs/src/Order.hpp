#pragma once
#include <string.h>
#include <assert.h>
#include <vector>
#include <unordered_map>
#include <string>
#include <algorithm>
#include "types.hpp"
#include "Report.hpp"
#include "Account.hpp"

struct OrderInfo
{
    quantity_t LeavesQty;
    sequence_t NormSequence; //Seq should be revert, 
};

//70000001,Mal,73.21,100,100001,BUY
//ID      party price qty time side
class OrderEntry
{
public:
    OrderEntry(const std::vector<std::string> &OrderStr) 
    {
        assert(OrderStr[0].size()<sizeof(this->ID)); 
        strncpy(this->ID, OrderStr[0].data(), sizeof(this->ID)-1);

        assert(OrderStr[1].size()<sizeof(this->Party));
        strncpy(this->Party, OrderStr[1].data(), sizeof(this->Party)-1);

        this->Price = strtold(OrderStr[2].data(), NULL)*SCALIANG_FACTOR;
        assert((strtold(OrderStr[2].data(), NULL)*1000.0-this->Price) < 2);

        this->Qty = atoi(OrderStr[3].data());
        this->Sequence = atoi(OrderStr[4].data());

        if(OrderStr[5]=="BUY")
            this->Side = ::Side::BUY;
        else
            this->Side = ::Side::SELL;

        this->Info.LeavesQty = this->Qty;
        this->Info.NormSequence = ~this->Sequence;
    }

    void crossQty(quantity_t qty) {Info.LeavesQty -= qty;}
    bool empty() {return Info.LeavesQty==0;}
    bool isBuy() {return Side == ::Side::BUY;};
    const char* getID() const {return ID;}
    const char* getParty() {return Party;}
    price_t     getPrice() {return Price;}
    quantity_t  getCurrentQty() {return Info.LeavesQty;}
    quantity_t  getTotalQty() {return Qty;}
#ifdef NORMAL_RULE_APPLY
    size_t getKey()  {return Key;}
#else
    quantity_t getKey()  {return getCurrentQty();}
#endif

    template<Side>
    quantity_t match(OrderEntry* pIncomingOrder);

private:
    union {
        uint64_t Key;
        OrderInfo Info;
    };
    price_t Price;
    quantity_t Qty;
    sequence_t Sequence;
    ID_t ID;
    party_t Party;
    char Side;

};

//Price is matched when OrderGroup::match is called
class OrderGroup
{
public:
    OrderGroup() {  mOrders.reserve(16); }
    void addOrder(OrderEntry* pOrder)
    {
        mOrders.push_back(pOrder); 
        mTotalQty += pOrder->getTotalQty();
        mLeavesQty += pOrder->getCurrentQty(); //Match first, then added to book. Left Qty may less than total qty
        assert( 0!= pOrder->getCurrentQty());
    }

    void sortForAuction()
    {
        std::sort(mOrders.begin(), mOrders.end(), [](const auto pOrder1, const auto pOrder2){return pOrder1->getKey() > pOrder2->getKey();});
    }

    template<Side side>
    bool match(OrderEntry* pIncomingOrder)
    {
        //lazy sort. Only happend when matching
        std::sort(mOrders.begin(), mOrders.end(), [](const auto pOrder1, const auto pOrder2){return pOrder1->getKey() > pOrder2->getKey();});
        for (auto iter=mOrders.begin(); iter!=mOrders.end();)
        {
            mLeavesQty -= (*iter)->match<side>(pIncomingOrder);
            if((*iter)->empty())
                iter = mOrders.erase(iter);
            else
                iter++;
            if(pIncomingOrder->empty()) //we have to quit now, return sth useful
                return true;
        }
        return false;
    }

//used for auction rule
    template<Side side>
    bool match(size_t& qty)
    {
        auto crossQty_ = std::min(qty, this->mLeavesQty);
        qty -= crossQty_;
        mLeavesQty -= crossQty_;
        return qty == 0;
    }

    bool empty() 
    {
#if 0
        assert((mLeavesQty==0) == mOrders.empty());
#endif
        return mLeavesQty==0;
    }

    size_t getTotalQty() {return mTotalQty;}

    std::vector<OrderEntry*>::iterator begin()
    {
        return mOrders.begin();
    }
    std::vector<OrderEntry*>::iterator end()
    {
        return mOrders.end();
    }
    
    void consolidateGroupQty(size_t& sumSofar)
    {
        mTotalQty += sumSofar;
        sumSofar = mTotalQty;
    }

    void restoreGroupQty(size_t& sumSofar)
    {
        mLeavesQty = mTotalQty;
    }
private:
    std::vector<OrderEntry*> mOrders;
    size_t mTotalQty {0};
    size_t mLeavesQty {0};
};

extern Accounts_t Accounts;
template<>
inline quantity_t OrderEntry::match<::Side::BUY>(OrderEntry* pIncomingOrder)
{
    auto crossQty_ = std::min(pIncomingOrder->getCurrentQty(), this->getCurrentQty());
    pIncomingOrder->crossQty(crossQty_);
    this->crossQty(crossQty_);
    
    //generate Report here report.push_back(pIncomingOrder->ID, this->ID, crossQty_, this->Price);
    ReportManager::Instance().addReport(pIncomingOrder, this, crossQty_, Price);
    Accounts[this->getParty()].update<::Side::BUY>(crossQty_, Price);
    Accounts[pIncomingOrder->getParty()].update<::Side::SELL>(crossQty_, Price);
    
#ifndef NDEBUG
    printf("%s vs %s cross %d@%f\n", pIncomingOrder->ID, ID, crossQty_, Price/1000.0);
#endif
    assert(pIncomingOrder->getPrice() <= Price);
    return crossQty_;
}

template<>
inline quantity_t OrderEntry::match<::Side::SELL>(OrderEntry* pIncomingOrder)
{
    auto crossQty_ = std::min(pIncomingOrder->getCurrentQty(), this->getCurrentQty());
    pIncomingOrder->crossQty(crossQty_);
    this->crossQty(crossQty_);
    
    //generate Report here report.push_back(pIncomingOrder->ID, this->ID, crossQty_, this->Price);
    ReportManager::Instance().addReport(pIncomingOrder, this, crossQty_, Price);
    Accounts[this->getParty()].update<::Side::SELL>(crossQty_, Price);
    Accounts[pIncomingOrder->getParty()].update<::Side::BUY>(crossQty_, Price);
#ifndef NDEBUG
    printf("%s vs %s cross %d@%f\n", pIncomingOrder->ID, ID, crossQty_, Price/1000.0);
#endif
    assert(pIncomingOrder->getPrice() >= Price);
    return crossQty_;
}

