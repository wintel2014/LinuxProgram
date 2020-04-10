#include "../../Utils/sysconf.h"
#include <stdlib.h>
#include <string.h>
#include <stdio.h>
#include <sys/mman.h>
#include <sys/types.h>
#include <unistd.h>
#include <errno.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <signal.h>
#include "../../Utils/readTsc.hpp"

/*
Same memory size for NON-Huge and huge
1. page fault will trigger zero-filled page, HUGE latency > non-huge latency
2. HUGE page bandwidth 2% better than non-huge
*/

static size_t HUGE_PAGE_SIZE = 512l*PAGESIZE;
#define msleep(count) usleep((count)*1000)

int main(int argc, char* argv[])
{
    if(argc != 3)
    {
        printf("Input HugePage number and cpu cycles\n");
        return -1;
    }

    int pages = atoi(argv[1]);
    int MHZ = atoi(argv[2]);

    static size_t mapLen = pages*HUGE_PAGE_SIZE;
#ifdef NO_HUGEPAGE
    char* addr  = static_cast<char*>(mmap(nullptr, mapLen, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, 0, 0));
    madvise(addr, mapLen, MADV_NOHUGEPAGE);
#else
    char* addr  = static_cast<char*>(mmap(nullptr, mapLen, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS|MAP_HUGETLB, 0, 0));
#endif
    if (addr == MAP_FAILED)
    {
        printf("Failed to mmap:%s\n", strerror(errno));
        return -1;
    }

    auto start = readTsc();
#ifdef NO_HUGEPAGE
    for(size_t off=0; off<mapLen; off+=PAGESIZE)
#else
    for(size_t off=0; off<mapLen; off+=HUGE_PAGE_SIZE)
#endif
    {
        addr[off] = 1; 
    }

    auto duration = readTsc() - start;
#ifdef NO_HUGEPAGE
    duration = duration/(mapLen/PAGESIZE);
#else
    duration = duration/pages;
#endif
    printf("PageFault average : %lu cycles [%lf us]\n", duration, 1.0*duration/MHZ);

    int loop = 0;
    auto stride = 16;
    start = readTsc();
    while(loop++ < 20)
    {
        for(size_t off=0; off<mapLen; off+=stride)
        {
            *reinterpret_cast<int*>(addr+off) = off; 
        }
    }
    duration = (readTsc() - start)/loop;

    printf("%lu cycles [%lu us], bandwidth = %lu MB\n\n", duration, duration/MHZ, mapLen/(duration/MHZ));
}
