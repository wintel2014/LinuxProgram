#include <string.h>
#include <sys/mman.h>
#include <stack>
#include <iterator>
#include <iostream>
#include <algorithm>
#include <array>
#include <stdlib.h>
#include <assert.h>
//#define DEBUG


inline unsigned long readTsc()
{
    register unsigned long tsc __asm__("%rax");
    __asm__ volatile("rdtsc;\n shl $0x20, %%rdx;\n or %%rdx,%%rax": "=a"(tsc):: "%rcx", "%rdx");
    return tsc;
}

struct MemoryRingBuffer
{
    MemoryRingBuffer()
    {
        static_assert(MAX_ELEMENTS_CNT*256 < HUGEPAGE_SIZE);
        char* storage = reinterpret_cast<char*>(std::aligned_alloc(HUGEPAGE_SIZE, HUGEPAGE_SIZE));
        if(!storage)
        {
            perror("Failed to allocate memory:");
            exit(-1);
        }
        mOrderArray[0] = storage;
        mlock(storage, HUGEPAGE_SIZE);

        storage = reinterpret_cast<char*>(std::aligned_alloc(HUGEPAGE_SIZE, HUGEPAGE_SIZE));
        if(!storage)
        {
            perror("Failed to allocate memory:");
            exit(-1);
        }
        mlock(storage, HUGEPAGE_SIZE);
        mOrderArray[1] = storage;
        for(auto iter:mOrderArray)
        {
            memset(iter, 0, HUGEPAGE_SIZE);
        }
        for(auto& iter:mFreeSlots)
        {
            short index = MAX_ELEMENTS_CNT-1;
            static_assert(std::numeric_limits<short>::max() > MAX_ELEMENTS_CNT);
            while(index >= 0)
                iter.push(index--);
        }
#if 0
        for(int i=0; i<128; i++)
        {
            printf("%3d ", mFreeSlots[0].top());
            mFreeSlots[0].pop();
        }
        printf("\n");
#endif
#ifdef DEBUG
        printf("order-64:%p\n", mOrderArray[0]);
        printf("order-64:%p\n", mOrderArray[1]);
#endif
    }

    ~MemoryRingBuffer()
    {
        std::free(mOrderArray[0]);
        std::free(mOrderArray[1]);
    }

    template <typename T>
    static constexpr int orderIndex()
    {
        constexpr size_t alignReq = alignof(T);
        constexpr size_t size = sizeof(T);
        static_assert(alignReq<=256 && size<=256);

        if(size <= 64)
            return 0;
        else
            return 1;
    }
    
    static constexpr int orderLevel(size_t order)
    {
        constexpr size_t array[] = {6, 8};
        return array[order];
    }

#define CVT2ADDR(order, slot) (mOrderArray[(order)]+((slot)<<orderLevel(order)))
    template<typename T>
    void* acquire()
    {
        constexpr size_t order = orderIndex<T>();
        if(mFreeSlots[order].empty())
            return nullptr;
        auto freeSlot= mFreeSlots[order].top();
        mFreeSlots[order].pop();
#ifdef DEBUG
        printf("Acquire: slot[%ld][%3d]=%p\n", order, freeSlot, mOrderArray[order]+(freeSlot<<orderLevel(order)));
#endif
        return CVT2ADDR(order, freeSlot);
    }
    template<typename T>
    void release(void* ptr)
    {
        constexpr size_t order = orderIndex<T>();
        unsigned short slot = (reinterpret_cast<char*>(ptr)-mOrderArray[order]) >> orderLevel(order);
        assert(slot < MAX_ELEMENTS_CNT);
        mFreeSlots[order].push(slot);
#ifdef DEBUG
        printf("Release: slot[%ld][%3d]=%p\n", order, slot, ptr);
#endif
        return ;
    }

    static constexpr unsigned short MAX_ELEMENTS_CNT=5*1024;
    static constexpr size_t MB=1024l*1024;
    static constexpr size_t HUGEPAGE_SIZE=2l*MB;

    std::array<char*, 2> mOrderArray;
    std::array<std::stack<unsigned short>, 2> mFreeSlots;

};

struct BigObj
{
    char mData[256];
};



int main()
{
    MemoryRingBuffer mbr;
    void* ptr = mbr.acquire<int>();
    mbr.release<int>(ptr);

    auto begin = readTsc();
    ptr = mbr.acquire<int>();
    printf("Acquire<int>() consumed %ld cycles\n", readTsc()-begin);
    mbr.release<int>(ptr);

    begin = readTsc();
    ptr = mbr.acquire<int>();
    printf("Acquire<int>() consumed %ld cycles\n", readTsc()-begin);
    mbr.release<int>(ptr);
    
    mbr.acquire<BigObj>();
    mbr.acquire<BigObj>();

    begin = readTsc();
    ptr = mbr.acquire<BigObj>();
    printf("Acquire<BigObj>() consumed %ld cycles\n", readTsc()-begin);

    mbr.release<BigObj>(ptr);
    ptr = mbr.acquire<BigObj>();
    mbr.release<BigObj>(ptr);
}
