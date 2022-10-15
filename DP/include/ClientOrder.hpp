struct ClientOrder
{
    short mCode;
    char mSide; //BUY SELL
    char mType; //IOC DAY
    char mInvestorID[34];
    double mPrice;
    int  mQty;
    int  mVolume;
};
