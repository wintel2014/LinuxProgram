#include <stdio.h>
#include "../readTsc.hpp"
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

int main(int argc, char* argv[])
{
    auto start = readTsc();
    printf("%ld\n", readTsc()-start);

    start = readTsc();
    volatile int a=0;
    auto end = readTsc();
    printf("%ld\n", end-start);

    start = readTsc();
    a=0;
    printf("%ld\n", readTsc()-start);

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
