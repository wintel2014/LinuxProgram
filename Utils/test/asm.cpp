#include <stdio.h>
#define bit2index(pos, value) __asm__ __volatile__("bsf %1, %0\n" : "=r" (pos) : "rm" (value) : "cc");
#define bit2index2(index, num)  __asm__ ("bsrl %1, %0":"=r"(index):"rm"(num): "cc");
//#define bit2index(index, num)  __asm__ ("bsf %1, %0":"=r"(index) :"r"(num):);

static inline void bitSet(long *set, int index)
{
	asm("btsl %1,%0" : "+m"(*set) : "Ir"(index - 1) : "cc");
}
int main()
{
    int index = 0;
    unsigned long long data = 0x3l<<36;
    bitSet(&data, 5);
    bit2index(index, data)
    printf("%d\n", index);
    bit2index2(index, data)
    printf("%d\n", index);
}
