#include <vector>
#include <stdio.h>
#include "../../Utils/readTsc.hpp"
#include "../../Utils/affinity.hpp"
//
//  cat /sys/devices/system/cpu/cpu0/cache/index*/size
//  32K
//  32K
//  256K
//  9216K
//

constexpr size_t L3_CACHE_SIZE = 9216*1024;
int main()
{
    SetAffinity(3);
    constexpr auto ElementCount = L3_CACHE_SIZE*2; 
    std::vector<int> Data(ElementCount, 0); //sizeof(int)==4
    for(int i=0; i<10; i++)
        for(auto &ref:Data)
            ref = i;

    long ret = 0;
    auto count = 0;
    auto start = readTsc();
    auto end = start;
#if 1
    for(unsigned i=0; i<ElementCount; i++)
    {
        count++;
        ret += Data[i];
    }

    for(unsigned i=0; i<ElementCount; i++)
    {
        count++;
        ret -= Data[i];
    }
    end = readTsc()-start;
    printf("%ld, cycles=%ld count=%d\n", ret, end, count);
#endif
#if 1
    auto stride = L3_CACHE_SIZE/sizeof(int)/16;
    count = 0;
    start = readTsc();
    for(int current=0; current<ElementCount; current+=stride)
    {
        auto End = std::min(ElementCount, current+stride);
        for(unsigned i=current; i<End; i++)
        {
            count++;
            ret += Data[i];
        }

        for(unsigned i=current; i<End; i++)
        {
            count++;
            ret -= Data[i];
        }
    }
    end = readTsc()-start;
    printf("%ld, cycles=%ld count=%d\n", ret, end,count);
#endif
}
