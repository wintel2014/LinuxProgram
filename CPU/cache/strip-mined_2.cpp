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

long __attribute__((noinline)) Add(const int*pData, const size_t count)
{
    long ret = 0;
    for(unsigned i=0; i<count; i++)
    {
        ret += pData[i];
    }
    return ret;
}
long __attribute__((noinline)) Sub(const int*pData, const size_t count)
{
    long ret = 0;
    for(unsigned i=0; i<count; i++)
    {
        ret -= pData[i];
    }
    return ret;
}
constexpr size_t L3_CACHE_SIZE = 9126*1024;
int main()
{
    SetAffinity(3);
    constexpr auto ElementCount = L3_CACHE_SIZE*8; ////sizeof(int)==4, 32*L3_CACHE_SIZE; 
    std::vector<int> Data(ElementCount, 0);
    for(int i=0; i<10; i++)
        for(auto &ref:Data)
            ref = i;

    long ret = 0;
    auto start = readTsc();
    ret += Add(Data.data(), ElementCount);
    ret += Sub(Data.data(), ElementCount);
    auto end = readTsc()-start;
    printf("%ld, cycles=%ld \n", ret, end);

    auto stride = L3_CACHE_SIZE/sizeof(int)/4;
    ret = 0;
    start = readTsc();
    for(int current=0; current<ElementCount; current+=stride)
    {
        /*
            Even more function calls are generated here, but the performance much better than the previous.
            0, cycles=200171358
            0, cycles=108667153
        */
        ret += Add(Data.data()+current, stride);
        ret += Sub(Data.data()+current, stride);
    }
    end = readTsc()-start;
    printf("%ld, cycles=%ld\n", ret, end);
}
