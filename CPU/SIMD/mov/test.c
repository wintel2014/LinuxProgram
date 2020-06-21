#include <stdio.h>
unsigned long readTsc()
{
    register unsigned long tsc __asm__("%rax");
    __asm__ volatile("rdtscp;\n shl $0x20, %%rdx;\n or %%rdx,%%rax": "=a"(tsc):: "%rcx", "%rdx");
    return tsc;
}

long mova(long* src, long* dest);
long movu(long* src, long* dest);
long movnt(long* src, long* dest);
#define CORE_UNALIGN_ACCESS
int main()
{
    long a[3] = {0x12345678, 0xabcdef0123};
    long b[2] = {0};
    unsigned long start = readTsc();
    movu((long*)((char*)a+1), b);
    unsigned long cycles = readTsc()-start;
    printf("0x%lx 0x%lx, cycles=%ld\n", b[0], b[1], cycles);

    start = readTsc();
    mova(a, b);
    printf("0x%lx 0x%lx, cycles=%ld\n", b[0], b[1], cycles);

#ifdef CORE_UNALIGN_ACCESS
    mova(a+1, b);
#endif

    start = readTsc();
    movnt(a, b);
    cycles = readTsc()-start;
    printf("0x%lx 0x%lx, cycles=%ld\n", b[0], b[1], cycles);

    long c[4], d[4];
    start = readTsc();
    movnt(c, d);
    cycles = readTsc()-start;
    printf("0x%lx 0x%lx, cycles=%ld\n", c[0], c[1], cycles);
}
