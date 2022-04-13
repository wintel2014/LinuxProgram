
#include <x86intrin.h>
inline unsigned long readTsc()
{
    register unsigned long tsc __asm__("%rax");
    __asm__ volatile("rdtsc;\n shl $0x20, %%rdx;\n or %%rdx,%%rax": "=a"(tsc):: "%rcx", "%rdx");
    return tsc;
}

static inline size_t ffzll(long long i)
{
	return ffsll(~i);
}
static inline size_t fls(unsigned long word)
{
	asm("bsrq %1,%0" : "=r" (word)  : "rm" (word));
	return word;
}

static inline void clear_bit(long nr,   long *addr)
{
	asm volatile("btrq %1,%0" : : "m" (*( long *) (addr)), "Ir" (nr) : "memory");
}
static inline void set_bit(long nr,   long *addr)
{
	asm volatile("btsq %1,%0" : : "m" (*( long *) (addr)), "Ir" (nr) : "memory");
}


size_t  lzcnt(long long l)  //Counts the number of leading most significant zero bits 
{
    return __lzcnt64(l);
}

size_t  tzcnt(long long l)  //Counts the number of  trailing least significant zero bits 
{
    return _tzcnt_u64(l);
}

size_t BitSetCount(long long data)
{
	size_t count = 0;
	while(data)
	{
		data = data & (data-1);
		count++;
	}
	return count;
}

