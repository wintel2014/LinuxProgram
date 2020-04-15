#pragma once
#include <functional>
#include "Order.hpp"

template<Side s, typename CMP>
class Book {
public:
    using CMP_TYPE = CMP; 
    static typename std::map<price_t, OrderGroup, CMP>::iterator begin()
    {
        return mOrderMap.begin();
    }
    static typename std::map<price_t, OrderGroup, CMP>::iterator end()
    {
        return mOrderMap.end();
    }
    
    //static std::function<bool(price_t, price_t)> mCmp;
    static void addOrder(price_t price, OrderEntry* pOrder) 
    {
        mOrderMap[price].addOrder(pOrder);
    }

#ifndef NDEBUG
    static void dispBook(bool isAuction = false) 
    {
        if(isAuction)
        {
            for(auto& iter:mOrderMap)
            {
                printf("%s %.3lf: %lu", (s==Side::BUY) ? "B":"S", iter.first/SCALIANG_FACTOR, iter.second.getTotalQty());
                printf("\n");
            }
        }
        else
        {
            for(auto& iter:mOrderMap)
            {
                printf("%d:", iter.first);
                for(auto &order : iter.second)
                {
                    printf(" %s*%u", order->getID(), order->getCurrentQty());
                }
                printf("\n");
            }
        }
    }
#endif

    static bool match(OrderEntry* pIncomingOrder) //true: fully filled; false: partial fill/Non-fill
    {
        if (mOrderMap.empty())
            return false;
        auto BestOrderGroup = mOrderMap.begin();
        auto&& cmp = mOrderMap.key_comp();
        if(cmp(pIncomingOrder->getPrice(), BestOrderGroup->first))
        {
            return false;
        }
        bool fullyFilled = false;
        do{
            auto& group = BestOrderGroup->second;
            fullyFilled = group.template match<s>(pIncomingOrder);
            if(group.empty())
                BestOrderGroup = mOrderMap.erase(BestOrderGroup);
            else
                BestOrderGroup++;

            if(fullyFilled || cmp(pIncomingOrder->getPrice(), BestOrderGroup->first))
                return fullyFilled;

        }while(BestOrderGroup!=mOrderMap.end());
        return true;    
    }

//***************************** Used for Auction match********************************
    static void consolidateQty()
    {
        size_t sumQty = 0;
        for(auto& groupPair:mOrderMap)
        {
            auto& group = groupPair.second;
            group.consolidateGroupQty(sumQty);
        }
    }

    static void restoreQty()
    {
        size_t sumQty = 0;
        for(auto& groupPair:mOrderMap)
        {
            auto& group = groupPair.second;
            group.restoreGroupQty(sumQty);
        }
    }

    static bool match(size_t& qty, price_t crossPrice) 
    {
        if (mOrderMap.empty())
            return false;
        if(mOrderMap.key_comp()(crossPrice, mOrderMap.begin()->first))
        {
            return false;
        }
        auto BestOrderGroup = mOrderMap.upper_bound(crossPrice); //the first order is passive than crossPrice
        BestOrderGroup--;
        auto crossQty_ = std::min(qty, BestOrderGroup->second.getTotalQty());
        qty -= crossQty_;
        return qty == 0;
    }

private:
    static std::map<price_t, OrderGroup, CMP> mOrderMap;
};
