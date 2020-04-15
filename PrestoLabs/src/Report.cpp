#include "Report.hpp"
#include "Order.hpp"

ReportEntry::ReportEntry(const OrderEntry* pOrder1, const OrderEntry* pOrder2, quantity_t crossQty, price_t crossPrice)
{
    strncpy(ID1, pOrder1->getID(), sizeof(ID1));
    strncpy(ID2, pOrder2->getID(), sizeof(ID2));
    
    mOrderPtr1 = pOrder1;
    mOrderPtr2 = pOrder2;
    
    mCrossQty = crossQty;
    mCrossPrice = crossPrice;

}
