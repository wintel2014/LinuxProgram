#include <sys/mman.h>
#include <stdio.h>
int main()
{
    constexpr unsigned long  length = 1024l*1024*1024*12;
    //constexpr unsigned long  length = 1024*126;
    auto buffer = mmap(nullptr, length, PROT_READ|PROT_WRITE, MAP_PRIVATE | MAP_ANONYMOUS,
                  -1, 0);
    if(buffer == MAP_FAILED)
    {
        perror("Failed to mmap:");
        return -1;
    }
    else
        printf("%p\n", buffer);
    while(1)
        ;
}

