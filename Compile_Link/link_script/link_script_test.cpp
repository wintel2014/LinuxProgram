//http://docs.adacore.com/live/wave/binutils-stable/html/ld/ld.html

/*
1. text must align with HUGEPAGE_SIZE
2. remap must completed before main. It can't located in text segment
*/
#include <errno.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/mman.h>

extern char __executable_start;
extern char __etext;
// PROVIDE(__text_start_debug = .);
extern char __text_start_debug, __text_end_debug;
char* text_start_addr = &__text_start_debug;
const char* text_end_addr = &__text_end_debug;
/*
THP can't support non-anymous mapping, we can't get THP by "mmap exetuable files, then start it"
1.copy text into temp addr
2.munmap text range
3.remap the text segment by MAP_FIXED
4.restore the text contens.
*/
int __attribute__((section("remap_text_section"))) RemapTextSegment() //try our best to minimize the dynamic lib dependency
{
    printf("Text starts from %p, ends at %p\n", text_start_addr, text_end_addr);
    const auto InstSize = text_end_addr - text_start_addr;
    char* const pInst = reinterpret_cast<char*>(malloc(InstSize));
    auto index = 0;
    while(index < InstSize)
    {
        pInst[index] = text_start_addr[index];
        index++;
    }

    if (munmap(text_start_addr, InstSize)<0)
    {
        printf("Failed to munmap:%s\n", strerror(errno));
        return -1;
    }
    if (mmap(text_start_addr, InstSize, PROT_READ|PROT_WRITE, MAP_FIXED|MAP_PRIVATE|MAP_ANONYMOUS, 0, 0) == MAP_FAILED)
    {
        printf("Failed to mmap:%s\n", strerror(errno));
        return -1;
    }
    
    if(madvise(text_start_addr, InstSize, MADV_HUGEPAGE) <0)
    {
        printf("Failed to madvise:%s\n", strerror(errno));
        return -1;
    }
    for(index = 0; index <InstSize; index++)
        text_start_addr[index] = pInst[index];

    if (mprotect(text_start_addr, InstSize, PROT_READ|PROT_EXEC) < 0)
    {
        printf("Failed to mprotect:%s\n", strerror(errno));
        return -1;
    }
    free(pInst);
}    

static int remap_ret = RemapTextSegment();
int main(void)
{
  printf("executable_start=%p\n", &__executable_start);
  printf("text_start=%p\n", &__text_start_debug);
  printf("text_end=%p\n", &__text_end_debug);
  printf("etext=%p\n", &__etext);
  printf("remap=%d\n", remap_ret);
  return 0;
}
