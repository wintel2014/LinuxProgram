#pragma once
#include <cstdlib>
struct ClientOrder
{
    char mSide; //BUY SELL
    char mType; //IOC DAY
    char mInvestorID[34];
    char mSymbol[16];
    size_t mID;
    double mPrice;
    int  mQty;
    int  mVolume;
};


