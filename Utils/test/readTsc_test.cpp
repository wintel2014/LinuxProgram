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
    printf("%ld\n", readTsc()-start);

    start = readTsc();
    if(argc > 1)
        a = argc>>1;
    else
        a = argc<<1;
    auto end = readTsc();
    printf("branch cost %ld\n", end-start);

    int array[4096];

    
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
        TSCCount t;
        memset(array, 0, sizeof(array));
        printf("memset cost ");
    }

    
    start = readTsc();
    Init<SizeOfArray(array)-1>(array);
    printf("Init cost %ld\n", readTsc()-start);

    {
        TSCCount t;
        Init(array);
        printf("Init cost ");
    }
}
