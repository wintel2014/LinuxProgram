#define likely(x)      __builtin_expect(!!(x), 1) 
#define unlikely(x)    __builtin_expect(!!(x), 0)

#include <stdio.h>
#include "../../Utils/readTsc.hpp"
#include "../../Utils/affinity.hpp"
//branch0-2 generate the same instructions
void __attribute__((noinline)) branch0(int argc)
{
    int count = 0;
    auto start = readTsc();
    if(likely(argc==1))
        count = 0x5678;
    else
        count = 0x1234;
    auto duration = readTsc() - start;
    printf("%x, %ld\n",count, duration);
}
void __attribute__((noinline)) branch1(int argc)
{
    int count = 0;
    auto start = readTsc();
    if(unlikely(argc==1))
        count = 0x5678;
    else
        count = 0x1234;
    auto duration = readTsc() - start;
    printf("%x, %ld\n",count, duration);

}
void __attribute__((noinline)) branch2(int argc)
{
    int count = 0;
    auto start = readTsc();
    if(argc==1)
        count = 0x5678;
    else
        count = 0x1234;
    auto duration = readTsc() - start;
    printf("%x, %ld\n",count, duration);

}
void __attribute__((noinline)) branch3(int argc)
{
    int count = 0;
    auto start = readTsc();
    int i = 0;
    while(i++ < 1000)
        if( i&1==1 )
            count += 0x5678;
        else
            count += 0x1234;
    auto duration = readTsc() - start;
    printf("%x, %ld\n",count, duration);

}
int main(int argc, char* argv[])
{
    SetAffinity(1);
    branch0(argc);
    branch1(argc);
    branch2(argc);
    branch3(argc);
    printf("%d\n",argc);
} 
