/*
1. mlock will get the all physical memory right time
2. when VM_LOCKED, munmmap will walk through each page to move it from unevictable LRU to target LRU. It requires PG_locked
3. all the threads require PG_locked wil triggered multiple context switches. it takes long time.
4. mmap/brk will be blocked during munmap, so malloc will take a long time
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

#define gettid() syscall(__NR_gettid)
std::atomic<bool> startMap{false};
std::atomic<bool> startUNMap{false};

std::atomic<int> endMap{0};
constexpr long HZ=2500;
constexpr size_t M = (1024*1024);
constexpr size_t G = 1024*M;
constexpr size_t len1 = G;
constexpr size_t len2 = G+512*M;

#define VM_LOCKED
void mmap_fun(int fd)
{
    while(!startMap.load());

    auto start = readTsc();
#ifdef VM_LOCKED
    void * addr = mmap(0, len1, PROT_READ|PROT_WRITE, MAP_SHARED|MAP_LOCKED, fd, 0);
#else
    void * addr = mmap(0, len1, PROT_READ|PROT_WRITE, MAP_SHARED, fd, 0);
    //if(mlock(addr, len)<0)
    //{
    //    printf("Failed to mlock: %s\n", strerror(errno));
    //    return ;
    //}
#endif

    if(addr == MAP_FAILED)
    {
        printf("Failed to mmap: %s\n",strerror(errno));
        return ;
    }
    auto end = readTsc();
    printf("thread-%ld: mmap   duration=%ld us\n", gettid(), (end-start)/HZ);

    endMap++;

    while(!startUNMap.load());
    if(( munmap(addr, len1) != -1) &&(mmap(0, len2, PROT_READ|PROT_WRITE, MAP_SHARED|MAP_LOCKED, fd, 0)!=MAP_FAILED) )
        printf("thread-%ld: munmap+mmap duration=%ld us\n", gettid(), (readTsc()-end)/HZ);

    while(1) sleep(1);
}

int main()
{
    
    const char* fileName = "/dev/shm/hugefile";
    remove(fileName);
    auto fd = open(fileName, O_RDWR|O_CREAT);
    if(fd<0)
    {
        printf("Failed to open:%s\n", strerror(errno));
        return -1;
    }
    ftruncate(fd, len2);

    std::vector<std::thread> Threads;

    #define THREAD_COUNT 16
    for(int i=0; i<THREAD_COUNT; i++)
        Threads.push_back(std::thread(mmap_fun, fd));
    startMap.store(true);
    
    while(endMap.load() != THREAD_COUNT);

    startUNMap.store(true);
    
    usleep(50*1000);
    constexpr size_t malloc_count = 10;
    size_t gap[malloc_count];
    for(int i=0; i<sizeof(gap)/sizeof(size_t); i++)
    {
        auto start = readTsc();
        void * addr = malloc(4*1024*i);
        free(addr);
        gap[i] = (readTsc()-start)/HZ;
    }
    for(auto t:gap)
        printf("malloc consume %ld us\n", t);
    for(auto & t:Threads)
        t.join();

}
