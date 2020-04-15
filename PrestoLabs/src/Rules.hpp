bool ParseFiles(Map& OrderCSVMap, Map& OrderBinMap, std::vector<std::string>& lines)
{
    const char* fileName = "/dev/shm/orders.csv";
    if(!OrderCSVMap.MapFile(fileName))
    {
        return false;
    }

    boost::string_ref str(static_cast<char*>(OrderCSVMap.addr()));
#ifndef NDEBUG
    printf("string size=%lu\n", str.size());
#endif

    boost::split(lines, str, [](char c){return c=='\n';});
    if(!OrderBinMap.MapFile("/dev/shm/Orders.bin", sizeof(OrderEntry)*lines.size()))
    {
        return false;
    }

    ReportManager::Instance().init(lines.size()*2);

    //The last line is terminated by '\n', then the empty string will push into lines.
    if(lines.rbegin()->empty())
        lines.pop_back();
    return true;
}

bool ProcessNormalOrders()
{
    Map OrderCSVMap;
    Map OrderBinMap;
    std::vector<std::string> lines;
    if(!ParseFiles(OrderCSVMap, OrderBinMap, lines))
        return false;
    
    OrderEntry* const OrderMapAddr = static_cast<OrderEntry*>(OrderBinMap.addr());
    int index = 0;
    for(auto & line:lines)
    {
        //70000001,Mal,73.21,100,100001,BUY
        //ID      party price qty time side
        std::vector<std::string> OrderStr;
        boost::split(OrderStr, line, [](char c){return c==',';});
        assert(OrderStr.size() == 6);
        auto pIncoming = OrderMapAddr + index;
        new(pIncoming)OrderEntry(OrderStr);
    
        if (pIncoming->empty()) // zero order check;
            continue;
        
        if(pIncoming->isBuy())
        {
            if (BookSell::match(pIncoming)) //The order is fully crossed
                continue;
            BookBuy::addOrder(pIncoming->getPrice(), pIncoming);
        }
        else
        {
            if (BookBuy::match(pIncoming))
                continue;
            BookSell::addOrder(pIncoming->getPrice(), pIncoming);
        }
        index++;

    }
#if 0
    printf("Buy Book:\n");
    BookBuy::dispBook();
    printf("Sell Book:\n");
    BookSell::dispBook();
#endif

    for(auto& account:Accounts)
    {
        printf("%10s:\t", account.first.c_str());
        account.second.disp();
    }
    return true;

}

bool ProcessAuctionOrders()
{
    Map OrderCSVMap;
    Map OrderBinMap;
    std::vector<std::string> lines;
    if(!ParseFiles(OrderCSVMap, OrderBinMap, lines))
        return false;

    OrderEntry* const OrderMapAddr = static_cast<OrderEntry*>(OrderBinMap.addr());
    int index = 0;
    for(auto & line:lines)
    {
        //70000001,Mal,73.21,100,100001,BUY
        //ID      party price qty time side
        std::vector<std::string> OrderStr;
        boost::split(OrderStr, line, [](char c){return c==',';});
        assert(OrderStr.size() == 6);
        auto pIncoming = OrderMapAddr + index++;
        new(pIncoming)OrderEntry(OrderStr);
        if(pIncoming->isBuy())
            BookBuy::addOrder(pIncoming->getPrice(), pIncoming);
        else
            BookSell::addOrder(pIncoming->getPrice(), pIncoming);
    }
    BookBuy::consolidateQty();
    BookSell::consolidateQty();

#ifndef NDEBUG
    printf("=================================After consolidate==========================================\n");
    printf("Buy Book:\n");
    BookBuy::dispBook(true);
#endif

    double maxVolume = 0;
    price_t targetPrice = 0.0;
    for(auto buyOrderGroup=BookBuy::begin(); buyOrderGroup!=BookBuy::end(); buyOrderGroup++)
    {
        auto buyPrice = buyOrderGroup->first;
        size_t Qty = buyOrderGroup->second.getTotalQty();
        BookSell::match(Qty, buyPrice);
        auto totalCrossQty = buyOrderGroup->second.getTotalQty()-Qty;
        if(buyPrice/SCALIANG_FACTOR*totalCrossQty > maxVolume)
        {
            targetPrice = buyPrice;
            maxVolume = std::max(maxVolume, totalCrossQty/SCALIANG_FACTOR*targetPrice);
        #ifndef NDEBUG
            printf("targe price update to %lf, maxVolume=%lf crossQty=%ld\n", targetPrice/SCALIANG_FACTOR, maxVolume, totalCrossQty);
        #endif
        }
    }
#ifndef NDEBUG
    BookSell::consolidateQty();
    BookSell::dispBook(true);
    for(auto& account:Accounts)
    {
        printf("%10s:\t", account.first.c_str());
        account.second.disp();
        printf("\n");
    }
#endif
    std::cout<<targetPrice/SCALIANG_FACTOR<<"\n";

    BookSell::restoreQty(); //restore the leaveQty
    for(auto buyOrderGroupPair=BookBuy::begin(); buyOrderGroupPair!=BookBuy::end(); buyOrderGroupPair++)
    {
        if(targetPrice > buyOrderGroupPair->first)
            break;

        buyOrderGroupPair->second.sortForAuction(); //Actually, only the targetPrice group should be adjusted. But we can't generate the accurate Reports without sort()
        for(auto &buyOrder : buyOrderGroupPair->second)
        {
            BookSell::match(buyOrder);
        }
    }
    for(auto& account:Accounts)
    {
        printf("%10s:\t", account.first.c_str());
        account.second.disp();
    }
    return true;
}
