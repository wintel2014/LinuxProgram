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
    std::vector<long long> Data(ElementCount, 0); //sizeof(int)==4
    for(int i=0; i<10; i++)
        for(auto &ref:Data)
            ref = i;

    long ret = 0;
    auto start = readTsc();
    for(unsigned i=0; i<ElementCount-16; i+=8)
    {
        Data[i] = i;
        Data[i+1] = i;
        Data[i+2] = i;
        Data[i+3] = i;
        Data[i+4] = i;
        Data[i+5] = i;
        Data[i+6] = i;
        //Data[i+7] = i;
    }
    auto end = readTsc()-start;
    printf("%ld, cycles=%ld \n", ret, end);
}
