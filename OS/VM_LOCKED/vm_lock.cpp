/*
1. mlock will get the all physical memory right time
2. when VM_LOCKED, munmmap will walk through each page to move it from unevictable LRU to target LRU. It requires PG_locked
3. all the threads require PG_locked wil triggered multiple context switches. it takes long time.
4. mmap/brk will be blocked during munmap, so malloc will take a long time

test method:
    1. mmap+mlock concurrently in all threads / process
    2. munmap+malloc concurrently
*/

#include "../../Utils/readTsc.hpp"
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <unistd.h>
#include <sys/types.h>
#include <errno.h>
#include <stdio.h>
#include <sys/mman.h>
#include <string.h>
#include <atomic>
#include <thread>
#include <vector>
#include <sys/syscall.h>
#include <stdlib.h>
#include <sys/time.h>

#define gettid() syscall(__NR_gettid)
std::atomic<bool> startMap{false};
std::atomic<bool> startUNMap{false};

std::atomic<int> endMap{0};
size_t len = 0; 

#define VM_LOCKED
void mmap_fun(int fd)
{
    while(!startMap.load());

    auto start = readTsc();
    void * addr = mmap(0, len, PROT_READ|PROT_WRITE, MAP_SHARED, fd, 0);
#ifdef VM_LOCKED
    if(mlock(addr, len)<0)
    {
        printf("Process-%ld: Failed to mlock: %s\n", gettid(), strerror(errno));
        return ;
    }
#endif
    madvise(addr, len, MADV_NOHUGEPAGE);

    if(addr < 0)
    {
        printf("Failed to mmap: %s\n",strerror(errno));
        return ;
    }
    auto end = readTsc();
    printf("thread-%ld: mmap   duration=%ld us\n", gettid(), (end-start)/CPU_MHZ);

    endMap++;

    while(!startUNMap.load());
    end = readTsc();
    struct  timeval  tv1, tv2;
    struct  timezone tz;

    gettimeofday(&tv1,&tz);
    if( munmap(addr, len) != -1)
    {
        gettimeofday(&tv2,&tz);
        printf("thread-%ld: munmap duration=%ld us [%ld us]\n", gettid(), (readTsc()-end)/CPU_MHZ, (tv2.tv_sec-tv1.tv_sec)*1000*1000+(tv2.tv_usec-tv1.tv_usec));
    }

    while(1) sleep(1);
}

int main(int argc, char* argv[])
{

    if(argc <2)
    {
        printf("Input File Size\n");
        return -1;
    }

    len = atol(argv[1])-4096;
    
    const char* fileName = "/dev/shm/hugefile";
    //remove(fileName);
    auto fd = open(fileName, O_RDWR|O_CREAT);
    if(fd<0)
    {
        printf("Failed to open:%s\n", strerror(errno));
        return -1;
    }
    //ftruncate(fd, len);

    std::vector<std::thread> Threads;

    #define THREAD_COUNT 4
    for(int i=0; i<THREAD_COUNT; i++)
        Threads.push_back(std::thread(mmap_fun, fd));
    usleep(10*1000);
    startMap.store(true);
    
    while(endMap.load() != THREAD_COUNT);

    startUNMap.store(true);
    
    usleep(50*1000);
    constexpr size_t malloc_count = 20;
    size_t gap[malloc_count];
    for(int i=0; i<sizeof(gap)/sizeof(size_t); i++)
    {
        auto start = readTsc();
        void * addr = malloc(4*1024*i);
        free(addr);
        gap[i] = (readTsc()-start)/CPU_MHZ;
    }
    for(auto t:gap)
        if(t > 100)
            printf("malloc consume %ld us\n", t);

    printf("try\n\tcat /proc/%d/task/*/status | grep ctxt\n", getpid());
    for(auto & t:Threads)
        t.join();

}
