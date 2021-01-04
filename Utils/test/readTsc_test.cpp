#include <stdio.h>
#include <stdlib.h>
#include "../readTsc.hpp"
#include "../affinity.hpp"
#include <string.h>
template<size_t N, typename T>
void Init(T* ptr)
{
    *(ptr+N) = T{};
    Init<N-1, T>(ptr);
}

template<>
void Init<0,int>(int* ptr)
{
    *ptr = 0;
}
template<>
void Init<0,long>(long* ptr)
{
    *ptr = 0l;
}

template<size_t N, typename T>
constexpr size_t SizeOfArray(T(&)[N])
{
    return N;
}

template<size_t N, typename T>
void Init(T(&array)[N])
{
    Init<N, T>(static_cast<T*>(array));
}

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
    OverHead();

    SetAffinity<1>();   
    auto start = readTsc();
    printf("dura readtsc=%ld cycle\n", readTsc()-start);

    start = readTsc();
    a=0;
    auto end = readTsc();
    printf("%ld\n", end-start);

    constexpr long SIZE = 1024*1024*256l;
    constexpr long STRIDE = 4*1024; 
    volatile char* pSrc = (volatile char*)malloc(SIZE);
    for(int i=0; i<SIZE; i++)
      pSrc[i] = 0;

    start = readTsc();
    for(int i=0; i<SIZE; i+=STRIDE)
      pSrc[i%(32*1024)] = 0;
    printf("Per transction=%lf stride=%ld\n", (readTsc()-start)*1.0/(SIZE/STRIDE), STRIDE);

    start = readTsc();
    if(argc > 1)
        a = argc>>1;
    else
        a = argc<<1;
    end = readTsc();
    printf("branch cost %ld\n", end-start);

    //int array[4096];
    long array[4096];

    
    start = readTsc();
    Init<SizeOfArray(array)-1>(array);
    printf("Init cost %ld\n", readTsc()-start);

    start = readTsc();
    Init<SizeOfArray(array)-1>(array);
    printf("Init cost %ld\n", readTsc()-start);

    start = readTsc();
    Init<SizeOfArray(array)-1>(array);
    printf("Init cost %ld\n", readTsc()-start);

    {
        TSCCountVoid t;
        memset(array, 0, sizeof(array));
        printf("memset cost ");
    }

    
    start = readTsc();
    Init<SizeOfArray(array)-1>(array);
    printf("Init cost %ld\n", readTsc()-start);

    {
        TSCCountVoid t;
        Init(array);
        printf("Init cost ");
    }
}
