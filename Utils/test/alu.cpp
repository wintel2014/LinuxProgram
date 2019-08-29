#include <stdio.h>
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

int main(int argc, char* argv[])
{
    SetAffinity<3>();   
    auto start = readTsc();
    printf("%ld\n", readTsc()-start);

    float f = argc<2 ? 1.0:2.0;
    start = readTsc();
    for(int i=0; i<1000; i++)
        f = f*0.999;
    auto end = readTsc();
    printf("%.64f, %ld\n",f, end-start);

    f = argc<2 ? .0000000000000000000000000000000000000000000123:2.0;
    start = readTsc();
    for(int i=0; i<1000; i++)
        f = f*0.999;
    end = readTsc();
    printf("%.64f, %ld\n",f, end-start);

    double d = argc<2 ? .0000000000000000000000000000000000000000000000000000000000000123:2.0;
    start = readTsc();
    for(int i=0; i<1000; i++)
        d = d*0.999;
    end = readTsc();
    printf("%.64lf, %ld\n",d, end-start);

}
