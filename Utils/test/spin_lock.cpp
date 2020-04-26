#include "../spinlock.hpp"
#include "../readTsc.hpp"
#include "../affinity.hpp"
#include <thread>
#include <mutex>
#include <iostream>
#include <sys/syscall.h>  
#include <vector>
#define gettid() syscall(__NR_gettid) 

//#define USE_ATOMIC
#ifdef USE_ATOMIC
    std::atomic<size_t> gCount;
#else
    SpinLock gLock;
    size_t gCount {0};
#endif

size_t ticksPerUS = 0;
constexpr size_t gLoop_per_thread = 1000*1000*20;
size_t gTicks[256] = {0};

void threadFun(int cpu)
{
    auto start = readTsc();
    auto max = readTsc() - start;
    SetAffinity(cpu);
    auto thread = gettid();
    size_t index =0;
    while(index++ < gLoop_per_thread)
    {
#ifdef DEBUG
        auto start2 = readTsc();
#endif

#ifdef USE_ATOMIC
    gCount++;
#else
        {
            std::lock_guard<SpinLock> l_(gLock);
            volatile int i;
            i++;
            gCount++;
        }
#endif

#ifdef DEBUG
        auto tmp = readTsc()-start2;
        if (tmp > max)
        {
            max = tmp;
            printf("%ld:duration = %ld ticks\n", thread, max);
        }
#endif
    }
    printf("%ld:duration = %ld ticks, %ld us\n", thread, readTsc()-start, (readTsc()-start)/ticksPerUS);
}
#ifndef TOTAL_CORE
#define TOTAL_CORE nrcpus
#endif
int main()
{
    int cpu = 0;
    std::vector<std::thread> ThreadVec;
    auto start = readTsc();
    sleep(1);
    auto ticks= readTsc() - start;
    ticksPerUS = ticks/1000/1000;
    printf("%ld ticks per second, %ld ticks per us\n", ticks, ticksPerUS);
    while(cpu < TOTAL_CORE)
    {
        ThreadVec.emplace_back(std::thread(threadFun, cpu++));
    }

    for(auto& T:ThreadVec)
        T.join();
#ifdef USE_ATOMIC
    printf("gCount = %lu, ThreadCount = %lf\n", gCount.load(), gCount.load()*1.0/gLoop_per_thread);
#else
    printf("gCount = %lu, ThreadCount = %lf\n", gCount, gCount*1.0/gLoop_per_thread);
#endif
}
