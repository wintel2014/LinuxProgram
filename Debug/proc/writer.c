#include <unistd.h>
#include <stdio.h>
#include <stdlib.h>

#define N (4ul*1024*1024*2014)
int main()
{
    volatile int a=0x12345678;
    printf("%p = 0x%x\n", &a, a);


    volatile char* pChar = malloc(N);
    for(unsigned long i=0; i<N; i++)
        pChar[i] = 0x33;
    
    printf("%p = 0x%x\n", pChar, *(int*)pChar);
    while(1)
        sleep(100);
    return 0;
}
