#pragma once
#include <stdio.h>
#include <unordered_map>
#include <string>
#include <string.h>
#include <stddef.h>
#include "types.hpp"
struct Account
{
    size_t longQty{0};
    double longVolume{0.0};
    size_t shortQty{0};
    double shortVolume{0.0};

    template<Side>
    void update(quantity_t qty, price_t price);

    void disp()
    {
    #ifndef NDEBUG
        printf("L %-6lu %-11.2lf ; ", longQty, longVolume);
        printf("S %-6lu %-11.2lf\n", shortQty, shortVolume);
    #endif
        if(longQty > shortQty)
            printf("L %-8lu\n", longQty-shortQty); 
        else
            printf("S %-8lu\n", shortQty-longQty); 
    }

};
#if PARTY_NO_OVERLAP
static auto hash = [](const char* Id){ return std::hash<short>{}(*reinterpret_cast<const short*>(Id)); };
static auto comp = [](const char* l, const char* r){ return strncmp(l, r, sizeof(party_t))==0; };
using Accounts_t = std::unordered_map<const char*, Account, decltype(hash), decltype(comp)>;
#else
using Accounts_t = std::unordered_map<std::string, Account>;
#endif

template<>
void inline Account::update<Side::BUY>(quantity_t qty, price_t price)
{
    longQty += qty;
    longVolume += qty*price/SCALIANG_FACTOR;
} 
template<>
void inline Account::update<Side::SELL>(quantity_t qty, price_t price)
{
    shortQty += qty;
    shortVolume += qty*price/SCALIANG_FACTOR;
} 
