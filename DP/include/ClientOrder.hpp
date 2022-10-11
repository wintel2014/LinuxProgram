struct ClientOrder
{
    double mPrice;
    int  mQty;
    int  mVolume;
    char mSide; //BUY SELL
    char mType; //IOC DAY
    char mInvestorID[30];
};
