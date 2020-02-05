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
#define PAGE_MASK (~(page_size-1))

void* get_page (unsigned long pfn) {
    unsigned long addr = pfn*page_size;
	unsigned long off = addr & PAGE_MASK;
	int i = 0;
	static int kfd = -1;

	kfd = open("/dev/mem",O_RDWR);
	if (kfd < 0) {
		perror("open");
		exit(0);
	}

	char *const map = mmap(NULL, page_size, PROT_READ|PROT_WRITE, MAP_SHARED, kfd, off);
	if (map == MAP_FAILED) {
		perror("mmap");
		exit(-1);
	}

	return map;
}

int main(int argc, char **argv)
{
	char var[51];
	unsigned long addr;
	char ch;
	int r;
	
	if (argc < 2) {
		fprintf(stderr,"usage:\n\t%s pfn\t\t==> show the whole physical page\n\t%s pfn offset \t==> modify pfn[offset]\n\t"
                "%s pfn offset value  ==> pfn[offset]=value\n",argv[0], argv[0], argv[0]);
		exit(-1);
	}

	page_size = getpagesize();
	unsigned long pfn = strtoul(argv[1],NULL,10);
	volatile char* map = get_page(pfn);
   
    for(int off=0; off<page_size/sizeof(long); off++)
    {
        long * ptr = (long*)map+off; 
	    printf("%p --> 0x%lx\n", ptr, *ptr);
    }

    if(argc==2)
        return 0;
	unsigned long off = strtoul(argv[2],NULL,10);
	printf("Before change: %p --> 0x%x\n", map+off, *(int*)(map+off));
    //*(int*)(map+off) = 0x12121212;
    /*
    if the variable is located at stack, maybe crash if the whole page is manipulated.
    for(unsigned long i=0; i<page_size; i++)
    {
        map[i] = 0x12;
        printf("%p = %d\n", map+i, map[i]);
    }
    */

    if(argc == 4)
    {
        *(int*)(map+off) = strtoul(argv[3],NULL,16);
	    printf("After change : %p --> 0x%x\n", map+off, *(int*)(map+off));
    }

}
