#include <atomic>

enum LockPolicy
{
    WILD = 0,
    TICK,
    QCS
};
template<LockPolicy, bool Aligned>
class spin_lock;

template<typename Type, bool Aligned = false>
struct Storage
{
    Type mData{0};
};
template<typename Type>
struct Storage<Type, true>
{
    struct alignas(64) CACHE_LINE_ALIGN {};
    union {
        Type mData{0};
        CACHE_LINE_ALIGN align;
    };
};

template<>
class spin_lock<LockPolicy::WILD, false>
{
public:
    spin_lock() = default;
    void lock() noexcept 
    {
        while(mLock.test_and_set(std::memory_order_acquire))
            ; //if mLock returns true, try spin again
    }

    void unlock() noexcept
    {
       mLock.clear(std::memory_order_release); 
    }
    spin_lock(const spin_lock&) = delete;
    spin_lock& operator=(const spin_lock&) = delete;

private:
    std::atomic_flag mLock{ATOMIC_FLAG_INIT};
};

template<>
class alignas(64) spin_lock<LockPolicy::WILD, true>
{
public:
    spin_lock() = default;
    void lock() noexcept 
    {
        while(mLock.test_and_set(std::memory_order_acquire))
            ; //if mLock returns true, try spin again
    }

    void unlock() noexcept
    {
       mLock.clear(std::memory_order_release); 
    }
    spin_lock(const spin_lock&) = delete;
    spin_lock& operator=(const spin_lock&) = delete;

private:
    std::atomic_flag mLock{ATOMIC_FLAG_INIT};
};

template<bool Aligned>
class spin_lock<LockPolicy::TICK, Aligned>
{
public:
    spin_lock() = default;
    void lock() noexcept 
    {
        //static_assert(sizeof(*this) == 128, "aligned by 2 cache line");
        auto nextOwner = mNext.mData.fetch_add(1, std::memory_order_relaxed);
        while(nextOwner != mOwner.mData.load(std::memory_order_acquire))
            ;
    }

    void unlock() noexcept
    {
        mOwner.mData.fetch_add(1, std::memory_order_acquire);
    }

    spin_lock(const spin_lock&) = delete;
    spin_lock& operator=(const spin_lock&) = delete;
private:
    
    Storage<std::atomic<int>, Aligned> mOwner;
    Storage<std::atomic<int>, Aligned> mNext;
};
#if 0
using SpinLock = spin_lock<LockPolicy::WILD, false>;
#else
using SpinLock = spin_lock<LockPolicy::TICK, true>;
#endif
