#include "../spinlock.hpp"
#include "../readTsc.hpp"
#include "../affinity.hpp"
#include <thread>
#include <mutex>
#include <iostream>
#include <sys/syscall.h>  
#include <vector>
#define gettid() syscall(__NR_gettid) 

/*
https://software.intel.com/content/www/us/en/develop/documentation/vtune-help/top/reference/cpu-metrics-reference/split-stores.html

Split Stores
Metric Description
Throughout the memory hierarchy, data moves at cache line granularity - 64 bytes per line. Although this is much larger than many common data types, such as integer, float, or double, unaligned values of these or other types may span two cache lines. Recent Intel architectures have significantly improved the performance of such 'split stores' by introducing split registers to handle these cases. But split stores can still be problematic, especially if they consume split registers which could be servicing other split loads.

Possible Issues
A significant portion of cycles is spent handling split stores.

Tips
Consider aligning your data to the 64-byte cache line granularity.
Note that this metric value may be highlighted due to Port 4 issue.

*/
volatile unsigned long* gCountPtr;
#define gCount (*gCountPtr)
size_t ticksPerUS = 0;
constexpr size_t gLoop_per_thread = 1000*1000*1000;
size_t gTicks[256] = {0};

void threadWRFun(int cpu)
{
    SetAffinity(cpu);
    auto thread = gettid();
    size_t index =0;
    auto start = readTsc();
    long tmp;
    unsigned int d1, d2;
    while(index++ < gLoop_per_thread)
    {
      d1 = index;
      d2 = d1*2;
      tmp = (1l*d1<<32) | d2;
      gCount = tmp;
    }
    printf("%ld:duration = %ld ticks, %ld us\n", thread, readTsc()-start, (readTsc()-start)/ticksPerUS);
}
void threadRDFun(int cpu)
{
    SetAffinity(cpu);
    auto thread = gettid();
    size_t index =0;
    auto start = readTsc();
    while(index++ < gLoop_per_thread)
    {
      unsigned long tmp = gCount;
      unsigned int d1 = tmp>>32;
      unsigned int d2 = tmp&(0xFFFFFFFF);
      if(d2 != d1*2)
      {
        printf("%x %x, %lx\n", d1<<1 ,d2, tmp);
        *(char*)0xFFFFFFFFDEADADDD = 0;
      }

    }
    printf("%ld:duration = %ld ticks, %ld us\n", thread, readTsc()-start, (readTsc()-start)/ticksPerUS);
}
#define CROSS_CACHELINE
int main()
{
    auto rawPtr = reinterpret_cast<char*>((long long)malloc(512)&(~63));
    *rawPtr = 0;
    *(rawPtr+64) = 0;
#ifdef CROSS_CACHELINE 
    gCountPtr = (decltype(gCountPtr))(rawPtr+60);
#else
    gCountPtr = (decltype(gCountPtr))(rawPtr);
#endif
    printf("Conter ptr=%p alignof=%lu\n", gCountPtr, alignof(*gCountPtr));
    int cpu = 0;
    std::vector<std::thread> ThreadVec;
    auto start = readTsc();
    sleep(1);
    auto ticks= readTsc() - start;
    ticksPerUS = ticks/1000/1000;
    printf("%ld ticks per second, %ld ticks per us\n", ticks, ticksPerUS);
    ThreadVec.emplace_back(std::thread(threadWRFun, cpu++));
    ThreadVec.emplace_back(std::thread(threadRDFun, cpu++));

    for(auto& T:ThreadVec)
        T.join();
}
