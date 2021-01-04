#include <stdio.h>
#include <stdlib.h>
#include "../readTsc.hpp"
#include "../affinity.hpp"
#include <string.h>
template<size_t N>
inline void READTSC()
{
  __asm__ volatile("rdtsc;");
  if constexpr (N > 0)
    READTSC<N-1>();
  
}
void OverHead()
{
    constexpr size_t N=1050;
    auto start = readTsc();
    READTSC<N>();
    printf("rdtsc overhead = %lf\n", (readTsc()-start)*1.0/N);
}
volatile int a;
int main(int argc, char* argv[])
{

    SetAffinity<1>();   
    OverHead();

    auto start = readTsc();
    if(argc > 1)
        a = argc>>1;
    else
        a = argc<<1;
    printf("branch cost %ld\n", readTsc()-start);

}
