#include <stdio.h>
#include <thread>
#include <atomic>
#include <memory>
#include <vector>
#include <string.h>
#include <sys/mman.h>
#include <array>
#include <stdlib.h>
#include <assert.h>


inline unsigned long readTsc()
{
    register unsigned long tsc __asm__("%rax");
    __asm__ volatile("rdtsc;\n shl $0x20, %%rdx;\n or %%rdx,%%rax": "=a"(tsc):: "%rcx", "%rdx");
    return tsc;
}

class Queue
{
public:
    explicit Queue(std::size_t capacity_)
        :mWriteIndex(0),
        mReadIndex(0),
        mDataEnd(0),
        capacity(capacity_),
        mStorage(reinterpret_cast<char*>(std::aligned_alloc(HUGEPAGE_SIZE, capacity_)) )

    {}
    ~Queue() {std::free(mStorage);}
private:
    alignas(64) std::atomic<std::size_t> mWriteIndex;
    alignas(64) std::atomic<std::size_t> mReadIndex;
    std::size_t mDataEnd;
    std::size_t capacity;
    char* mStorage;                        

    static constexpr size_t MB=1024l*1024;
    static constexpr size_t HUGEPAGE_SIZE=2l*MB;
    friend class Producer;
    friend class Consumer;
};

class Producer
{
    public:
        explicit Producer(Queue& q)
            :mQueue(&q),
            mSnapWritePos(buffer()),
            mSnapWriteEnd(buffer())
        {}

        std::size_t writeCapacity() const
        {
            return std::size_t(mSnapWriteEnd - mSnapWritePos);
        }

        bool Reserve(std::size_t size)
        {
            return (size <= writeCapacity())
                ? true
                : size <= maximizeWriteCapacity();
        }

        void* writeBuffer(const void* src, std::size_t size)
        {
            assert(mSnapWritePos + size <= mSnapWriteEnd);

#ifndef BENCHMARK_LATENCY
            void* result = memcpy(mSnapWritePos, src, size);
#else
            void* result = mSnapWritePos;
#endif
            mSnapWritePos += size;
            return result;
        }

        void* write(const void* src, size_t size)
        {
            return writeBuffer(src, size);
        }

        void CommitAllocate()
        {
            const std::size_t newW = std::size_t(mSnapWritePos - buffer());
            mQueue->mWriteIndex.store(newW, std::memory_order_release);
        }

        void* acquire(size_t size)
        {
            while(!Reserve(size))
                ;
            auto result = write(nullptr, size);
            CommitAllocate();
            return result;
        }
    private:
        std::size_t maximizeWriteCapacity()
        {
            const std::size_t w = mQueue->mWriteIndex.load(std::memory_order_relaxed);
            const std::size_t r = mQueue->mReadIndex.load(std::memory_order_acquire);

            if (w < r)
            {
                mSnapWritePos = buffer() + w;
                mSnapWriteEnd = buffer() + r - 1;
            }
            else
            {
                const std::int64_t rightSize = std::int64_t(mQueue->capacity - w);
                const std::int64_t leftSize = std::int64_t(r) - 1;

                if (rightSize >= leftSize)
                {
                    mSnapWritePos = buffer() + w;
                    mSnapWriteEnd = buffer() + w + rightSize;
                }
                else
                {
                    mQueue->mDataEnd = w;
                    mSnapWritePos = buffer();
                    mSnapWriteEnd = buffer() + leftSize;
                }
            }

            return writeCapacity();
        }

        char* buffer() { return mQueue->mStorage; }

        Queue* mQueue;

        char* mSnapWritePos;
        char* mSnapWriteEnd;
};

class Consumer
{
    public:
        struct ResultVec
        {
            std::size_t size() const { return size1 + size2; }

            const char* buffer1 {nullptr};
            std::size_t size1  {0};
            const char* buffer2  {nullptr};
            std::size_t size2  {0};
        };

        explicit Consumer(Queue& q)
            :mQueue(&q)
        {}
        void consume()
        {
            beginRead();
            endRead();
        }


    private:
        char* buffer() { return mQueue->mStorage; }
        ResultVec beginRead()
        {
            const std::size_t w = mQueue->mWriteIndex.load(std::memory_order_acquire);
            const std::size_t r = mQueue->mReadIndex.load(std::memory_order_relaxed);

            mSnapReadEnd = w;

            if (r <= w)
            {
                return ResultVec{buffer() + r, w - r, nullptr, 0};
            }

            if (r < mQueue->mDataEnd)
            {
                return ResultVec{buffer() + r, mQueue->mDataEnd - r,
                        buffer(), w
                };
            }

            return ResultVec{buffer(), w, nullptr, 0};
        }

        void endRead()
        {
            mQueue->mReadIndex.store(mSnapReadEnd, std::memory_order_release);
        }
    
    private:
        Queue* mQueue;
        std::size_t mSnapReadEnd = 0;
};


void FixedSizeAllocateTest()
{
    Queue q(2l*1024*1024);
    std::atomic<bool> isStop{false};
    Producer producer(q);
    Consumer consumer(q);
    std::thread P ( [&isStop, &producer]() {
                            constexpr size_t total = 15l*1000*1000;
                            size_t loop=total;
                            auto begin = readTsc();
                            while(loop--)
                            {
                                producer.acquire(128);
                            }
                            printf("Acquire(128) consume %ld cycles\n", (readTsc()-begin)/total);
                            isStop.store(true, std::memory_order_release);
                          }
                   );
    std::thread C ( [&isStop, &consumer]() {
                            while(!isStop.load(std::memory_order_acquire))
                            {
                                consumer.consume();
                            }
                    }
                  );

    P.join();
    C.join();
}
void RandomSizeAllocateTest()
{
    Queue q(2l*1024*1024);
    std::atomic<bool> isStop{false};
    Producer producer(q);
    Consumer consumer(q);
    std::vector<unsigned short> randomSize;
    for(int i=0; i<0xFF; i++)
    {
        randomSize.push_back(random()%256);
    }
    std::thread P ( [&isStop, &producer, &randomSize]() {
                            constexpr size_t total = 15l*1000*1000;
                            size_t loop=total;
                            auto begin = readTsc();
                            while(loop--)
                            {
                                producer.acquire(randomSize[loop&0xFF]);
                            }
                            printf("Acquire(random) consume %ld cycles\n", (readTsc()-begin)/total);
                            isStop.store(true, std::memory_order_release);
                          }
                   );
    std::thread C ( [&isStop, &consumer]() {
                            while(!isStop.load(std::memory_order_acquire))
                            {
                                consumer.consume();
                            }
                    }
                  );

    P.join();
    C.join();
}

template <size_t N, typename CB>
void UnrollLoop(const CB& cb)
{
    cb();
    if constexpr (N-1)
    {
        UnrollLoop<N-1, CB>(cb);
    }
}
template<size_t N>
void FixedSizeAllocateTest()
{
    Queue q(2l*1024*1024);
    std::atomic<bool> isStop{false};
    Producer producer(q);
    Consumer consumer(q);
    std::thread P ( [&isStop, &producer]() {
                            constexpr size_t total = 15l*1000*1000;
                            size_t loop=total;
                            auto begin = readTsc();
                            while(loop--)
                            {
                                UnrollLoop<5>( [&producer](){ producer.acquire(128); });
                            }
                            printf("Acquire(128) consume %ld cycles\n", (readTsc()-begin)/total);
                            isStop.store(true, std::memory_order_release);
                          }
                   );
    std::thread C ( [&isStop, &consumer]() {
                            while(!isStop.load(std::memory_order_acquire))
                            {
                                consumer.consume();
                            }
                    }
                  );

    P.join();
    C.join();
}
int main()
{
    FixedSizeAllocateTest();
    RandomSizeAllocateTest();
    FixedSizeAllocateTest<10>();
}
