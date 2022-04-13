#include <MemoryRingBuffer2.hpp>
#include <thread>
#include <unistd.h>
#include <sys/syscall.h>
#include <algorithm>

template<size_t FIXED_SLICE_CNT=16*1024, size_t SLICE_SIZE=64>
struct ConcurrentMemoryRingBuffer 
{
     template<size_t SIZE>
    void* acquire()
    {
        return mBuffer.template acquire<SIZE>();
    }
    

    template<size_t SIZE>
    void release(void* ptr)
    {
        return mBuffer.template release<SIZE>(ptr);
    }

    bool empty()
    {
        return mBuffer.empty();
    }

    size_t size()
    {
        return mBuffer.size();
    }

    size_t capacity()
    {
        return FIXED_SLICE_CNT;
    }

    static inline thread_local MemoryRingBuffer<FIXED_SLICE_CNT, SLICE_SIZE> mBuffer;

};

template<typename T>
void torture(T& mbr)
{
    static thread_local auto TID =  syscall(__NR_gettid);
    std::vector<void*> slotPtrVec;
    for(int i=0; i<mbr.capacity(); i++)
    {
        slotPtrVec.push_back(mbr.template acquire<sizeof(int)>());
    }
    if(!mbr.empty())
    {
        printf("TID-%ld Failed to drain out the memory\n", TID);
        exit(-1);
    }
    for(auto iter:slotPtrVec)
    {
        mbr.template release<32>(iter);
    }
    printf("TID-%ld After allocate-release torture size=%ld\n",TID, mbr.size());
}

int main()
{
    ConcurrentMemoryRingBuffer mbr;
    int cores = std::thread::hardware_concurrency();
    auto thread_func =  [&mbr]() {
                            while(1)
                                torture(mbr);
                        };
    std::vector<std::thread> Threads;
    for(auto i=0; i<std::max(16,cores); i++)
    {
        Threads.emplace_back(thread_func);
    }

    for(auto& iter:Threads)
        iter.join();

}