#include <unistd.h>
#include <stdlib.h>
#include <string.h>
#include <stdio.h>
#include <sys/mman.h>
#include <sys/mman.h>
#include <errno.h>


int main(int argc, char* argv[])
{
    if(argc <2)
    {
        printf("Input Page count\n");
        return -1;
    }
    
    size_t pages = atoi(argv[1]);
    size_t LEN = pages*4096;

    char* addr  = static_cast<char*>(mmap(nullptr, LEN, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, 0, 0));
    if (addr == MAP_FAILED)
    {
        printf("Failed to mmap:%s\n", strerror(errno));
        return -1;
    }

    for(auto off=0; off<LEN; off+=4096)
    {
        addr[off] = 1; 
    }

    printf("sleep 5 seconds\n");
    usleep(5*1000*1000);
}
