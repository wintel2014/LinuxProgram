#include <immintrin.h>
#include <string.h>
#include "./cache_info.hpp"

#include <iostream>
#include <thread>
#include <chrono>
#include "../../Utils/readTsc.hpp"
#include "../../Utils/affinity.hpp"


constexpr int SIZE_A = 1024;
constexpr int SIZE_B = LLC::CAPACITY*16;
char gA[SIZE_A];
char gB[SIZE_B];

void flush_range(void* start, size_t size)
{
    auto pStart = (char*)start;
    _mm_mfence();
    for(int i=0; i<size; i+=64)
        _mm_clflush(pStart+i);
}
int main(int argc,  char* argv[])
{
    SetAffinity(3);
    memset(gA, argc, sizeof(gA));
    memset(gB, argc, sizeof(gA));
    volatile auto pA = (int*)gA;
    volatile auto pB = (int*)gB;
    constexpr int Count_A = SIZE_A/sizeof(*pA);
    constexpr int Count_B = SIZE_B/sizeof(*pB);

    long ret = 0;
    long loop = 0;
#if 1
    flush_range(gA, SIZE_A);
    flush_range(gB, SIZE_B);
    auto start = readTsc();
    for(int i=0; i<Count_A; i++)
        for(int j=0; j<Count_B; j++)
        {
            loop ++;
            ret += pA[i]+pB[j];
        }
    std::cout<<"loop="<<loop<<" "<<ret<<": "<<readTsc()-start<< " cycles" <<std::endl;
#endif
#if 1
    loop = 0;
    ret = 0;
    start = readTsc();
    flush_range(gA, SIZE_A);
    flush_range(gB, SIZE_B);
    constexpr int stride = 1024;
    for(int j=0; j<Count_B; j+=stride)
        for(int i=0; i<Count_A; i++)
            for(int jj=0; jj<stride; jj++)
            {
                loop ++;
                ret += pA[i]+pB[j+jj];
            }
    std::cout<<"loop="<<loop<<" "<<ret<<": "<<readTsc()-start<< " cycles" <<std::endl;
#endif
}
