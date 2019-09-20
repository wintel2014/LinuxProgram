#include <stdio.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <sys/types.h>
#include <unistd.h>
#include <stdlib.h>
#include <sys/mman.h>

/*
vma struct consist of slab, if too many vma that are not continuous exists, much more slab objects are consumed
cat /proc/meminfo | grep Slab

 Table   
 _______ 
|_______|
|_RED___|
|_______|
|       |
|_______|
|_RED___|
|_______|
*/

#define PAGE_SIZE (4096)
#define M (1024*1024)
#define ALIGN_BY_PAGE(addr) (void*)(((unsigned long long)addr)&(~(PAGE_SIZE-1l)))
int main()
{
    #define size (1024l*M*2)
    char* ptr = malloc(size);

    char* end = ptr+size;
    while(ptr < end)
    {
        mprotect(ALIGN_BY_PAGE(ptr), PAGE_SIZE, PROT_NONE);
        ptr += PAGE_SIZE<<1;
    }

    int count = 50;
    while(count-- > 0)
    {
        pid_t pid = fork();
        if(pid==0)
        {
            sleep(20);
            exit(0);
        }
        if(pid<0)
            printf("Failed to fork\n");
        
        
    }
    wait(NULL);
}
