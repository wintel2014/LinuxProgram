#include <string.h>
#include <stdio.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <sys/types.h>
#include <unistd.h>
#include <stdlib.h>

/*
after fork, pte is masked as RO, pagetault will be triggered by either father or child
even the physical memory had bee allocated before fork.
if child doesn't touch the addr before father the pagefault will be trriggered again when father access it.
*/

#define PAGE_SIZE (4096)
#define M (1024*1024)

#define CHILD_QUIT_AFTER_SECOND_PF
int main()
{
    #define size (1024l*M)
    char* ptr = malloc(size);

    for(long i=0; i<size; )
    {
        ptr[i] = 0;
        i+= PAGE_SIZE;
    }

    pid_t pid = fork();
    if(pid==0)
    {
    #ifdef CHILD_QUIT_AFTER_SECOND_PF
        sleep(20);
    #endif
        exit(0);
    }
    else
    {
        char args[32];
        memset(args, '\0', sizeof(args));
        sprintf(args, "ps -o min_flt,maj_flt,rss,vsz %d", getpid());
        printf("run %s\n", args);
        sleep(8);
        printf("what's min_flt\n");
        for(long i=0; i<size; )
        {
            ptr[i] = 0;
            i+= PAGE_SIZE;
        }
        printf("run again %s\n", args);
    }
    if(pid<0)
        printf("Failed to fork\n");
        
    #ifndef CHILD_QUIT_AFTER_SECOND_PF
    sleep(15);
    #endif
        
    wait(NULL);
}
