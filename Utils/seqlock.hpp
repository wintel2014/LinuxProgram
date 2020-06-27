//https://elixir.bootlin.com/linux/v2.6.39/source/include/linux/seqlock.h#L86
/*
   1. Multiple writers should be blocked
   2. The obj that is protected by SeqLock shouldn't involve ptr. Because the ptr is possible to free when referenced by writer.
   3. Writer owns higher priority for Reader
*/
enum SeqType 
{
    Reader = 0,
    Writer
};

template<SeqType, template LockPolicy, template SequenceCountType>
class seqlock
template<template LockPolicy, template SequenceCountType=unsigned long>
class seqlock<SeqType::Writer>
{
public:
    void lock()
    {
        mLock.lock();
        mSeqCount.fetch_add(1, std::memory_order_acquire) 
        
    }
    void unlock()
    {
        mLock.unlock();
    }

private:
    LockPolicy mLock;
    std::atomic<SequenceCountType> mSeqCount;

}
template<template LockPolicy, template SequenceCountType=unsigned long>
class seqlock<SeqType::Reader>
{
public:
    void lock()
    {
        mLock.lock();
        
    }
    void unlock()
    {}

private:
    LockPolicy mLock;
    std::atomic<SequenceCountType> mSeqCount;
}
