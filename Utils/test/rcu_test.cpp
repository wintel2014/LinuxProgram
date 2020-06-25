#include "../rcu.hpp"
#include "../gettid.hpp"
#include <string>
#include <stdio.h>

#include <iostream>
#include <iomanip>
#include <chrono>
auto t = std::chrono::system_clock::to_time_t(std::chrono::system_clock::now());


//Should defined in *.cpp
std::atomic<unsigned long> GlobalVersion{1};
thread_local std::atomic<unsigned long> CurrentVersionPerThread;
std::vector<std::atomic<unsigned long> *> ContainerOfVersion;

struct RCUTest
{
    std::string mData;
    char mArray[128*1024];
};

std::atomic<RCUTest*> gObjPtr {nullptr};
RCU<RCUType::Reader> ReaderGuard;
RCU<RCUType::Writer> WriterBlocker;

void ReaderFunc()
{
    RegisterVersion();
    while(1)
    {
        std::this_thread::sleep_for(std::chrono::milliseconds(3));
        std::lock_guard<RCU<RCUType::Reader>> l(ReaderGuard);
        auto tmpPtr = gObjPtr.load(std::memory_order_acquire);
        printf("tid-%ld, ptr=%p, %s\n", gettid(), tmpPtr, tmpPtr->mData.c_str());
    }
}

static std::mutex lock_for_node;
static std::vector<RCUTest*> FreeObjList;
void WriteFunc()
{
    while(1)
    {
        RCUTest* tmp = new RCUTest();
        *tmp = *gObjPtr.load(std::memory_order_acquire);

        using Precision = std::chrono::microseconds;
        std::stringstream ss;
        std::chrono::time_point<std::chrono::system_clock, Precision> tp = std::chrono::time_point_cast<Precision>(std::chrono::system_clock::now());
        time_t t = std::chrono::system_clock::to_time_t(tp);
        auto const msecs = tp.time_since_epoch().count() % 1000000;
        ss << std::put_time(std::localtime(&t), "%H:%M:%S") << "." << msecs;

        tmp->mData = ss.str();
        auto TOBEFREE = gObjPtr.load(std::memory_order_relaxed);
        gObjPtr.store(tmp, std::memory_order_release);

        {
            std::lock_guard<std::mutex> _l(lock_for_node);
            FreeObjList.push_back(TOBEFREE);
        }
    }
}

void FreeFunc()
{
    while(1)
    {
        std::this_thread::sleep_for(std::chrono::milliseconds(30));
        {
            std::lock_guard<std::mutex> _l(lock_for_node);
            if(FreeObjList.size()<15)
            {   
                continue;
            }
    
            WriterBlocker.wait();
            while(!FreeObjList.empty())
            {
                auto iter = FreeObjList.back();
                auto TOBEFREE = iter;
                //printf("Free:%p\n", TOBEFREE);
                delete TOBEFREE;
                FreeObjList.pop_back();
            }
        }
    }
    
}


int main()
{
    auto ObjPtrTmp = new RCUTest();
    ObjPtrTmp->mData = "test";
    gObjPtr.store(ObjPtrTmp, std::memory_order_release);

    std::vector<std::thread> Threads;
    Threads.push_back(std::thread(ReaderFunc));
    Threads.push_back(std::thread(ReaderFunc));
    Threads.push_back(std::thread(ReaderFunc));
    Threads.push_back(std::thread(ReaderFunc));
    Threads.push_back(std::thread(ReaderFunc));
    Threads.push_back(std::thread(ReaderFunc));
    Threads.push_back(std::thread(ReaderFunc));
    Threads.push_back(std::thread(WriteFunc));
    Threads.push_back(std::thread(FreeFunc));
    
    for(auto &t:Threads)
    {
        t.join();
    }
}
