#include <memory>
#include <iostream>
#include <vector>
#include <map>
#include <unordered_map>
#include <string>
#include <limits>
#include <boost/utility/string_ref.hpp>
#include <boost/algorithm/string/split.hpp>


#include "Book.hpp"
#include "FileMap.hpp"
#include "Report.hpp"
#include "Account.hpp"


#if PARTY_NO_OVERLAP
//simon and simon1 will be viewed as same one
Accounts_t Accounts(1000, hash, comp);
#else
Accounts_t Accounts(1000);
#endif

auto cmpBuy  = [](price_t p1, price_t p2) {return p1 > p2;};
auto cmpSell = [](price_t p1, price_t p2) {return p1 < p2;};
template<>
std::map<price_t, OrderGroup, decltype(cmpBuy)> Book<Side::BUY, decltype(cmpBuy)>::mOrderMap(cmpBuy);

template<>
std::map<price_t, OrderGroup, decltype(cmpSell)> Book<Side::SELL, decltype(cmpSell)>::mOrderMap(cmpSell);

using BookBuy = Book<Side::BUY, decltype(cmpBuy)>;
using BookSell= Book<Side::SELL, decltype(cmpSell)>;

#include "Rules.hpp"
int main()
{

#ifdef NORMAL_RULE_APPLY
    ProcessNormalOrders();
#else
    ProcessAuctionOrders();
#endif
}
