#include <stdio.h>
#include <sys/types.h>
#include <unistd.h>
#include <stdlib.h>
#include <sys/mman.h>
#include <string.h>
#include <sys/types.h>
#include <sys/wait.h>


#define MB (1024*1024)
#define GB (1024l*MB)
#define PAGE_SIZE (4096)
#define ALIGN_BY_PAGE(addr) (void*)(((unsigned long long)addr)&(~(PAGE_SIZE-1l)))
/*
cat /proc/sys/vm/overcommit_memory
0

0: The Linux kernel is free to overcommit memory (this is the default), a heuristic algorithm is applied to figure out if enough memory is available.
1: The Linux kernel will always overcommit memory, and never check if enough memory is available. This increases the risk of out-of-memory situations, but also improves memory-intensive workloads.
2: The Linux kernel will not overcommit memory, and only allocate as much memory as defined in overcommit_ratio.
*/
#define FREE_PHY_MEM (3*GB+512*MB)
int main()
{
    char* ptr = malloc(FREE_PHY_MEM);
    printf("%p\n", ptr);
    for(int i=0; i<200*1024; i++)
        ptr[i*1024] = '0';

    char* p_mid = ptr + FREE_PHY_MEM/2;
    mprotect(ALIGN_BY_PAGE(p_mid), PAGE_SIZE, PROT_NONE);

    pid_t pid1 = fork();
    if(pid1 == 0)
    {
        execlp("free", "-h", NULL);
        //char args[32];
        //memset(args, 0, 32);
        //sprintf(args, "cat /proc/%d/maps", getpid());
        //printf("%s\n",args);
        //execlp("/bin/cat", args, NULL);
    }
    wait(NULL);
}
