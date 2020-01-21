#include <stdio.h>
#include <atomic>
#include <iostream>

void foo(const char* arg)
{
    int v1;
    int v2;
    int v3;
    v1 = *arg +0x111;
    v2 = 3*v1;
    __asm volatile ("" ::: "memory");
    v3 = 0x333;
    printf("%d %d %d\n", v1, v2, v3);
}

/*
   0x0000555555554857 <+23>:    movl   $0x333,0x2007c7(%rip)        # 0x555555755028 <I_v3>
   0x0000555555554861 <+33>:    add    $0x111,%edx
   0x0000555555554867 <+39>:    lea    (%rdx,%rdx,2),%ecx
   0x000055555555486a <+42>:    mov    %edx,0x2007c0(%rip)        # 0x555555755030 <I_v1>
   0x0000555555554870 <+48>:    mov    %ecx,0x2007b6(%rip)        # 0x55555575502c <I_v2>
*/
int I_v1;
int I_v2;
int I_v3;
void foo1(const char* arg)
{
    I_v1 = *arg +0x111;
    I_v2 = 3*I_v1;
    std::atomic_thread_fence(std::memory_order_release); //only works between non-atomic and atomic.store(relaxed)
    I_v3 = 0x333;
    printf("%x %x %x\n", I_v1, I_v2, I_v3);
}

/*
=> 0x0000555555554880 <+0>:     movsbl (%rdi),%eax
   0x0000555555554883 <+3>:     lea    0x14a(%rip),%rsi        # 0x5555555549d4
   0x000055555555488a <+10>:    mov    $0x1,%edi
   0x000055555555488f <+15>:    add    $0x111,%eax
   0x0000555555554894 <+20>:    mov    %eax,0x20078a(%rip)        # 0x555555755024 <gv1>
   0x000055555555489a <+26>:    lea    (%rax,%rax,2),%eax
   0x000055555555489d <+29>:    mov    %eax,0x20077d(%rip)        # 0x555555755020 <gv2>
   0x00005555555548a3 <+35>:    xor    %eax,%eax
   0x00005555555548a5 <+37>:    movl   $0x333,0x20076d(%rip)        # 0x55555575501c <gv3>
*/
int gv1;
int gv2;
std::atomic<int> gv3;
void foo2(const char* arg)
{
    gv1 = *arg +0x111;
    gv2 = 3*gv1;
    //std::atomic_thread_fence(std::memory_order_release);
    std::atomic_signal_fence(std::memory_order_release); //prevent compiler optimization only
    gv3.store(0x333, std::memory_order_relaxed);
    printf("%d %d %d\n", gv1, gv2, gv3.load(std::memory_order_relaxed));
}

std::atomic<int> v2;
std::atomic<int> v3;
void foo3(const char* arg)
{
    int v1;
    v1 = *arg +0x111;
    v2.store(3*v1, std::memory_order_relaxed);
    v3.store(0x333, std::memory_order_release);
    printf("%d %d %d\n", v1, v2.load(std::memory_order_relaxed), v3.load(std::memory_order_relaxed));
}
void foo4(const char* arg)
{
    int v1;
    v1 = *arg +0x111;
    v2.store(3*v1, std::memory_order_relaxed);
    v3.store(0x333, std::memory_order_relaxed);
    printf("%d %d %d\n", v1, v2.load(std::memory_order_relaxed), v3.load(std::memory_order_relaxed));
}
int main(int argc, const char* argv[])
{
    foo(argv[0]);
    foo1(argv[0]);

    foo2(argv[0]);
    foo3(argv[0]);
    foo4(argv[0]);
}
