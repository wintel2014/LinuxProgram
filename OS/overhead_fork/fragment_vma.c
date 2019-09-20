#include <stdio.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <sys/types.h>
#include <unistd.h>
#include <stdlib.h>

/*
in the worst cases, each page used by APP requires 1 physical page consists of
last level page table

 PML4    Dir Ptr  Dir     Table  Offset
 _______ _______ _______ _______ ____________ 
|_______|_______|_______|_______|____________|

 Table               Page
 _______             _______ 
|_______|  ----->   |_______|
|_______|           |_______|
|_______|           |_______|
|_______|           |_______|
|_______|           |_______|
|_______|           |_______|
*/

#define PAGE_SIZE (4096)
#define M (1024*1024)
int main()
{
    #define size (1024l*M*2)
    char* ptr = malloc(size);

    unsigned int sizeMappedByLevel = (PAGE_SIZE/sizeof(void*))*PAGE_SIZE;
    for(long i=0; i<size; )
    {
        ptr[i] = 0;
        i+= sizeMappedByLevel;
    }

    int count = 200;
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
