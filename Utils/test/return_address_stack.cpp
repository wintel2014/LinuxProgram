#include <stdio.h>
#include "../readTsc.hpp"
#include <string.h>

void recursive_call(int n)
{
    if(n==0)
        return;
    else
        recursive_call(n-1);
}
int main(int argc, char* argv[])
{
    constexpr int N = 14;

    for(int i=0; i<10; i++)
    {
        recursive_call(N);
        recursive_call(N);
        recursive_call(N);
        recursive_call(N);
    }
    unsigned long ret;
    {
        TSCCount<unsigned long> t(ret);
        recursive_call(N);
    }
    printf("recursive call cost %ld, %lf\n", ret, ret*1.0/N);
}
