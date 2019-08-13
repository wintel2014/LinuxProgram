#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdarg.h>
#include <fcntl.h>
#include <unistd.h>
#include <errno.h>

#include <sys/types.h>
#include <sys/stat.h>
#include <sys/poll.h>
#include <sys/mman.h>

int page_size;
#define PAGE_SIZE page_size
#define PAGE_MASK (~(PAGE_SIZE-1))

void get_var (unsigned long addr) {
	off_t ptr = addr & ~(PAGE_MASK);
	off_t offset = addr & PAGE_MASK;
	int i = 0;
	char *map;
	static int kfd = -1;

	kfd = open("/dev/mem",O_RDONLY);
	if (kfd < 0) {
		perror("open");
		exit(0);
	}

	map = mmap(NULL,PAGE_SIZE,PROT_READ,MAP_SHARED,kfd,offset);
	if (map == MAP_FAILED) {
		perror("mmap");
		exit(-1);
	}
	printf("0x%lx --> 0x%lx\n",addr, *(long*)(map+ptr));

	return;
}

int main(int argc, char **argv)
{
	char var[51];
	unsigned long addr;
	char ch;
	int r;
	
	if (argc != 2) {
		fprintf(stderr,"usage: %s Physical Address\n",argv[0]);
		exit(-1);
	}

	page_size = getpagesize();
	addr = strtoul(argv[1],NULL,16);
	get_var(addr);
}
