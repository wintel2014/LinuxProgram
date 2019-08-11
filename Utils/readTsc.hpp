#include <type_traits>

inline unsigned long readTsc()
{
    register unsigned long tsc __asm__("%rax");
    __asm__ volatile("rdtscp;\n shl $0x20, %%rdx;\n or %%rdx,%%rax": "=a"(tsc):: "%rcx", "%rdx");
    return tsc;
}

template<typename... Args>
class TSCCount
{
    public:
        TSCCount(): mStart(readTsc()){}
        ~TSCCount() {printf("%ld\n", readTsc()-mStart); }
        TSCCount(const TSCCount&) = delete;
        TSCCount(TSCCount&&) =delete;
    private:
        decltype(readTsc()) mStart;
        
};

template<>
class TSCCount<decltype(readTsc())>
{
    public:
        TSCCount(decltype(readTsc())& ret): mStart(readTsc()), mDuration(&ret) {}
        ~TSCCount() { *mDuration = readTsc()-mStart; }
        TSCCount(const TSCCount&) = delete;
        TSCCount(TSCCount&&) =delete;
    private:
        decltype(readTsc()) mStart;
        decltype(readTsc())* mDuration{nullptr};
        
};

typedef TSCCount<> TSCCountVoid;
typedef TSCCount<decltype(readTsc())> TSCCountValue;