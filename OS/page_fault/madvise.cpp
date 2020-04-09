#include "../../Utils/sysconf.h"
#include <stdlib.h>
#include <string.h>
#include <stdio.h>
#include <sys/mman.h>
#include <sys/mman.h>
#include <errno.h>

/*
MADV_DONTNEED
       Do not expect access in the near future.  (For the time being, the application is finished with the given range, so the kernel can free resources associated with it.)

       After  a successful MADV_DONTNEED operation, the semantics of memory access in the specified region are changed: subsequent accesses of pages in the range will succeed, but will result in either repopu‐
       lating the memory contents from the up-to-date contents of the underlying mapped file (for shared file mappings, shared anonymous mappings, and shmem-based techniques such as System V shared memory seg‐
       ments) or zero-fill-on-demand pages for anonymous private mappings.

       Note  that, when applied to shared mappings, MADV_DONTNEED might not lead to immediate freeing of the pages in the range.  The kernel is free to delay freeing the pages until an appropriate moment.  The
       resident set size (RSS) of the calling process will be immediately reduced however.

       MADV_DONTNEED cannot be applied to locked pages, Huge TLB pages, or VM_PFNMAP pages.  (Pages marked with the kernel-internal VM_PFNMAP flag are special memory areas that are not managed by  the  virtual
       memory subsystem.  Such pages are typically created by device drivers that map the pages into user space.)

 MADV_FREE (since Linux 4.5)
        The  application no longer requires the pages in the range specified by addr and len.  The kernel can thus free these pages, but the freeing could be delayed until memory
        pressure occurs.  For each of the pages that has been marked to be freed but has not yet been freed, the free operation will be canceled if the  caller  writes  into  the
        page.   After a successful MADV_FREE operation, any stale data (i.e., dirty, unwritten pages) will be lost when the kernel frees the pages.  However, subsequent writes to
        pages in the range will succeed and then kernel cannot free those dirtied pages, so that the caller can always see just written data.  If there is  no  subsequent  write,
        the kernel can free the pages at any time.  Once pages in the range have been freed, the caller will see zero-fill-on-demand pages upon subsequent page references.

        The  MADV_FREE operation can be applied only to private anonymous pages (see mmap(2)).  On a swapless system, freeing pages in a given range happens instantly, regardless
        of memory pressure.
*/

/*
MADV_FREE: The physical page are freed at will by kernel. But before free, read access can return non-zero value, write access will prevent subsquent free
MADV_DONTNEED: THe physical page are freed immidately for user process, i.e RSS is reduced right now for non-shared anonymous VMA.

*/
void SumAllPage(size_t& ret, size_t* addr)
{
    for(auto off=0; off<PAGESIZE/sizeof(ret); off++)
        ret += addr[off];
}
int main()
{
    size_t LEN = 4*PAGESIZE;
    char* addr  = static_cast<char*>(mmap(nullptr, LEN, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, 0, 0));
    if (addr == MAP_FAILED)
    {
        printf("Failed to mmap:%s\n", strerror(errno));
        return -1;
    }

    for(auto off=0; off<LEN; off++)
    {
        addr[off] = off; 
    }

    if( madvise(addr+PAGESIZE, PAGESIZE, MADV_FREE) < 0)
    {
        printf("Failed to madvise:%s\n", strerror(errno));
        return -1;
    }

    size_t sum = 0;
    SumAllPage(sum, reinterpret_cast<size_t*>(addr+PAGESIZE));
    printf("sum=%ld\n",sum);

    size_t GREEDY_LEN = 3l*1024*1024*1024; //Give a pressure for physical memory, then MADV_FREE pages will be discarded.
    char* tmpAddr = static_cast<char*>(mmap(nullptr, GREEDY_LEN, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, 0, 0));
    for(size_t off=0; off<GREEDY_LEN; off+=PAGESIZE)
    {
        *reinterpret_cast<size_t*>(tmpAddr+off) = off;
    }

    addr[PAGESIZE] = 0;
    sum = 0;
    SumAllPage(sum, reinterpret_cast<size_t*>(addr+PAGESIZE));
    printf("sum=%ld\n",sum);

/*
MADV_DONTNEED
              total        used        free      shared  buff/cache   available
Mem:           3.3G        356M        2.9G          4K         57M        2.8G
Swap:          1.0G         73M        950M

MADV_FREE
              total        used        free      shared  buff/cache   available
Mem:           3.3G        3.1G        101M          0B         44M        2.7G
Swap:          1.0G         75M        948M

*/
#ifdef DROP_PM_IMMEDIATELY
    if( madvise(tmpAddr, GREEDY_LEN, MADV_DONTNEED) < 0)
#else
    if( madvise(tmpAddr, GREEDY_LEN, MADV_FREE) < 0)
#endif
    {
        printf("Failed to madvise:%s\n", strerror(errno));
        return -1;
    }
#ifdef GRAP_PAGE_AGAIN
    for(size_t off=0; off<GREEDY_LEN; off+=PAGESIZE)
    {
        *reinterpret_cast<size_t*>(tmpAddr+off+8) = 0;
    }
#endif
    sum = 0;
    for(size_t off=0; off<GREEDY_LEN/100; off+=PAGESIZE)
    {
        SumAllPage(sum, reinterpret_cast<size_t*>(tmpAddr+off));
    }
    printf("sum=%ld\n",sum);

    usleep(100*1000);
    auto pid = fork();
    if(pid<0)
        printf("Failed to fork: %s\n", strerror(errno)); // Cannot allocate memory
    //overcommit has to be adjusted
    if(pid == 0)
    {
        if(execl("/usr/bin/free", "filename", "-h")<0)
            printf("Failed to run: %s\n", strerror(errno));
    }
    else
    {
        while(1)
            usleep(100*1000);
    }
}

