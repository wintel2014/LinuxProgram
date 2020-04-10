/*
caller()
   0x0000555555554fa7 <+285>:   mov    $0x7,%edi
   0x0000555555554fac <+290>:   callq  0x555555554de8 <Fun(int)> //push $rip; jmp addr


Fun(int)   
   0x0000555555554de8 <+0>:     push   %rbp
   0x0000555555554de9 <+1>:     mov    %rsp,%rbp
   0x0000555555554dec <+4>:     sub    $0xb0,%rsp

   0x0000555555554e88 <+160>:   leaveq  // mov %rbp %rsp; pop rbp
   0x0000555555554e89 <+161>:   retq    // pop %rip


*/
#include <stdlib.h>
#include <string.h>
#include <stdio.h>
#include <sys/mman.h>
#include <sys/types.h>
#include <unistd.h>
#include <errno.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <signal.h>

static size_t HUGE_PAGE_SIZE = 512l*4096;
#define msleep(count) usleep((count)*1000)

void switch_stack(void* new_stack);
void restore_stack();
//#define USE_THP
int main(int argc, char* argv[])
{
    size_t mapLen = 16l*HUGE_PAGE_SIZE;
#ifdef USE_THP
    char* addr  = (mmap(NULL, mapLen, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, 0, 0));
    madvise(addr, mapLen, MADV_HUGEPAGE);
#else
//The hugepage is reserved for father process
//when COW child will receive SIGBUS if hugepage is not enough
    char* addr  = (char*)(mmap(NULL, mapLen, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS|MAP_HUGETLB, 0, 0));
#endif
    if (addr == MAP_FAILED)
    {
        printf("Failed to mmap:%s\n", strerror(errno));
        return -1;
    }
    printf("Switch stack to %p\n", addr+mapLen-HUGE_PAGE_SIZE);
    switch_stack(addr+mapLen-HUGE_PAGE_SIZE);
    printf("Restore stack\n");
    restore_stack();

}
