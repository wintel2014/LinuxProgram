#pragma once
//using uint128_t=unsigned __int128;
constexpr double SCALIANG_FACTOR = 1000.0;
using price_t=unsigned int;
using quantity_t=unsigned int;
using sequence_t=unsigned int;
using ID_t = char[10];
typedef char party_t [21];

enum Side : char
{
    BUY=0,
    SELL=1
};
