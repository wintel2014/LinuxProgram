#pragma once
#include <new>
#include "types.hpp"
#include "FileMap.hpp"
class OrderEntry;
class ReportEntry
{
public:
    ReportEntry(const OrderEntry* pOrder1, const OrderEntry* pOrder2, quantity_t crossQty, price_t crossPrice);
        //generate Report here report.push_back(pIncomingOrder->ID, this->ID, crossQty_, this->Price);
private:
    ID_t ID1; //Incoming order's ID
    ID_t ID2;
    quantity_t mCrossQty;
    price_t mCrossPrice;
     
//used for online analysis
    const OrderEntry* mOrderPtr1;
    const OrderEntry* mOrderPtr2;
};
class ReportManager
{
public:
    static ReportManager& Instance()
    {
        static ReportManager mgr;
        return mgr;
    }

    bool init(size_t entrySize)
    {
        if(!mReportsMap.MapFile("/dev/shm/Reports.bin", sizeof(ReportEntry)*entrySize))
        {
            printf("Failed to map Reports.bin\n");
            return false;
        }
        mEntryStart = static_cast<ReportEntry*>(mReportsMap.addr());
        mEntryCurrent = mEntryStart;
        return true;
    }

    ReportEntry* addReport(const OrderEntry* pOrder1, const OrderEntry* pOrder2, quantity_t crossQty, price_t crossPrice)
    {
        new(mEntryCurrent)ReportEntry(pOrder1, pOrder2, crossQty, crossPrice);
        return mEntryCurrent++;
    }

    ReportManager(const ReportManager&) = delete;
    ReportManager& operator=(const ReportManager&) = delete;
private:
    ReportManager() {}
    ReportEntry* mEntryStart;
    ReportEntry* mEntryCurrent;
    Map mReportsMap;
};
