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
The Intel Instruction Set Reference for x86 and x64 mentions nothing about alignment requirements for the INC instruction. All it says in reference to LOCK is:
This instruction can be used with a LOCK prefix to allow the instruction to be executed atomically.
The LOCK prefix documentation states:
The integrity of the LOCK prefix is not affected by the alignment of the memory field. Memory locking is observed for arbitrarily misaligned fields.
*/
std::atomic<size_t>* gCountPtr;
#define gCount (*gCountPtr)
size_t ticksPerUS = 0;
constexpr size_t gLoop_per_thread = 1000*1000;
size_t gTicks[256] = {0};

void threadFun(int cpu)
{
    SetAffinity(cpu);
    auto thread = gettid();
    size_t index =0;
    auto start = readTsc();
    while(index++ < gLoop_per_thread)
    {
      gCount++;
    }
    printf("%ld:duration = %ld ticks, %ld us\n", thread, readTsc()-start, (readTsc()-start)/ticksPerUS);
}
#ifndef TOTAL_CORE
#define TOTAL_CORE nrcpus
#endif
int main()
{
    auto rawPtr = reinterpret_cast<char*>((long long)malloc(512)&(~63));
    *rawPtr = 0;
    *(rawPtr+64) = 0;
#ifdef ATOMIC_CROSS_CACHELINE 
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
    while(cpu < TOTAL_CORE)
    {
        ThreadVec.emplace_back(std::thread(threadFun, cpu++));
    }

    for(auto& T:ThreadVec)
        T.join();
    printf("gCount = %lu, ThreadCount = %lf\n", gCount.load(), gCount.load()*1.0/gLoop_per_thread);
}
