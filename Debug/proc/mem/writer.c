#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>

#include <sys/mman.h>
#include <unistd.h>
#include <stdio.h>
#include <stdlib.h>

#define START (0x119400000)

#define N (4ul*1024*1024*2014)
int main()
{
	int kfd = open("/dev/mem",O_RDWR);
	if (kfd < 0) {
		perror("open");
		exit(0);
	}

	volatile char* map = mmap(NULL,4096,PROT_READ|PROT_WRITE,MAP_SHARED,kfd, START);
	if (map == MAP_FAILED) {
		perror("mmap");
		exit(-1);
	}



    for(unsigned long i=0; i<4096; i++)
        map[i] = 0x12;
    
    while(1)
        sleep(100);
    return 0;
}
