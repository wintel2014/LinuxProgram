#include <strings.h>
#include <stdio.h>
#include <x86intrin.h>

#include <algorithm>
/*
Dump of assembler code for function ffsll:
=> 0x00007fffff6506d0 <+0>:     endbr64
   0x00007fffff6506d4 <+4>:     mov    $0xffffffff,%edx
   0x00007fffff6506d9 <+9>:     bsf    %rdi,%rax
   0x00007fffff6506dd <+13>:    cmove  %rdx,%rax
   0x00007fffff6506e1 <+17>:    add    $0x1,%eax
   0x00007fffff6506e4 <+20>:    retq
*/
#define __stringify_1(x...)	#x
#define __stringify(x...)	__stringify_1(x)

#if 1
# define __ASM_FORM(x, ...)		x,## __VA_ARGS__
# define __ASM_FORM_RAW(x, ...)		x,## __VA_ARGS__
# define __ASM_FORM_COMMA(x, ...)	x,## __VA_ARGS__,
# define __ASM_REGPFX			%
#else
# define __ASM_FORM(x, ...)		" " __stringify(x,##__VA_ARGS__) " "
# define __ASM_FORM_RAW(x, ...)		    __stringify(x,##__VA_ARGS__)
# define __ASM_FORM_COMMA(x, ...)	" " __stringify(x,##__VA_ARGS__) ","
# define __ASM_REGPFX			%%
#endif



# define __ASM_SEL(a,b)		__ASM_FORM(b)
# define __ASM_SEL_RAW(a,b)	__ASM_FORM_RAW(b)

#define __ASM_SIZE(inst, ...)	__ASM_SEL(inst##l##__VA_ARGS__, \
					  inst##q##__VA_ARGS__)


#define RLONG_ADDR(x)			 "m" (*(volatile long *) (x))
#define WBYTE_ADDR(x)			"+m" (*(volatile char *) (x))

#define ADDR				RLONG_ADDR(addr)
static inline void clear_bit(long nr, volatile unsigned long *addr)
{
	asm volatile("btrq %1,%0" : : "m" (*(volatile long *) (addr)), "Ir" (nr) : "memory");
}
static inline void set_bit(long nr, volatile unsigned long *addr)
{
	asm volatile("btsq %1,%0" : : "m" (*(volatile long *) (addr)), "Ir" (nr) : "memory");
}

static inline unsigned long fls(unsigned long word)
{
	asm("bsrq %1,%0" : "=r" (word)  : "rm" (word));
	return word;
}

static inline size_t ffs_test(unsigned long x)
{
	size_t r;
	asm("bsf %1,%0\n\t"
	    "cmovzl %2,%0"
	    : "=&r" (r) : "rm" (x), "r" (-1));

	return r + 1;
}

size_t popcnt(unsigned int data)
{
    return _mm_popcnt_u32(data);
}
long  lzcnt(long long l)  //Counts the number of leading most significant zero bits 
{
    return __lzcnt64(l);
}

long  tzcnt(long long l)  //Counts the number of leading most significant zero bits 
{
    return _tzcnt_u64(l);
}

size_t ffzll(long long i)
{
	return ffsll(~i);
}



    size_t MaxContinuosZero(unsigned long data)
    {
        size_t maxSoFar = 0, currentRet = 0;
        unsigned long BIT=0x1;
        for(int i=0; i<64; i++)
        {
            if((BIT<<i) & data)
            {         
                currentRet=0;
            }
            else
            {
                maxSoFar = std::max(++currentRet, maxSoFar);
            }
        }
		return maxSoFar;
    }

    template <size_t SLICES>
    size_t Find(size_t * pBM)
    {
        size_t NR = ffsll(pBM[0]);
        size_t data;
        unsigned long BIT=0x1;
        size_t maxSoFar = 0, currentRet = 0;
        if(NR<SLICES)
        {
            for(int bit=0; bit<192; bit++)
            {
                auto shift = bit%64;
                if(shift==0)
                {
                    data = pBM[bit/64];
                }
                if((BIT<<shift) & data)
                {
                    currentRet = 0;
                }
                else
                {
                    maxSoFar = std::max(++currentRet, maxSoFar);
                    if(maxSoFar == SLICES)
                        return bit;
                }
            }
        }
        return 0;
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
int main()
{
	long long i = 0xF0;
	printf("ffsll(0xf0)=%d\n", ffsll(i));
	printf("ffsll(0x0)=%d =0\n", ffsll(0));
	printf("fls(0xf0)=%ld\n", fls(i));
	printf("ffzll(0x00)=%ld\n", ffzll(0x00));
	printf("ffzll(0xff)=%ld\n", ffzll(0xFF));
	printf("lzcnt(0x1)=%ld\n", lzcnt(1l));
	printf("tzcnt(0x10F)=%ld\n", tzcnt(0x10F));
	unsigned long d=0xf0;
	clear_bit(7, &d);
	printf("i=%lx\n", d);

	unsigned long d2=0x00;
	set_bit(7, &d2);
	printf("set_bit(7, 0x00) i=%lx\n", d2);

	d2= 0xFFF0FF0000E00004l;
	printf("MaxContinuosZero(%lx)=%ld\n", d2, MaxContinuosZero(d2));


	size_t bitMap[3];
	constexpr size_t slices = 8;
	bitMap[0]=0xFFFFFFFFF00FFF0F;
	bitMap[1]=0xFFFFFFFFFFFFFFFF;
	bitMap[2]=0xFFFFFFFFFFFFFF00;
	printf("Find<%ld>(bitMap)=%ld\n", slices, Find<slices>(bitMap)-slices+1);

	d2 = 0xF010111;
	printf("BitSetCount(%lx)=%ld\n", d2, BitSetCount(d2));	
	printf("popcnt(%lx)=%ld\n", d2, popcnt(d2));	
}
