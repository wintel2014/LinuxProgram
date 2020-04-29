#include "../../../Utils/readTsc.hpp"
#include <string>
#include <execinfo.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <thread>
#include <vector>
#include <atomic>
std::atomic<int> ready{0} ;

struct Foo
{
    Foo(long i, const char* ch) noexcept : mStr(ch) 
    {
        mData = i;
    }
    long mData;
    std::string mStr;
};

Foo gF(0x87654321, "global static");
Foo& getStaticVar_1() noexcept
{
    return gF;
}
Foo& getStaticVar_2() noexcept
{
    static Foo local_static_f(0x12345678, "local static");
    return local_static_f;
}

void thread_fun()
{
    while(!ready.load())
        ;
    for(int i=0; i<60; i++)
    {
        auto start = readTsc();
        getStaticVar_1();
        auto end1 = readTsc();
        getStaticVar_2();
        auto end2 = readTsc();
#ifdef DEBUG
        printf("version1=%lu ticks; version2=%lu ticks\n", end1-start, end2-start);
#endif
    }
}
int main()
{
    constexpr int THREADS_TOTAL = 2;
    std::vector<std::thread> ThreadVec;
    for(int i=0; i<THREADS_TOTAL; i++)
        ThreadVec.push_back(std::thread(thread_fun));
    
    ready.store(1);

    for(auto& t:ThreadVec)
        t.join();

}
/*
(gdb) bt
#0  Foo::Foo (this=0x555555759060 <gF>, i=2271560481, ch=0x555555556ca2 "global static") at static_test.cpp:16
#1  0x0000555555555431 in __static_initialization_and_destruction_0 (__initialize_p=1, __priority=65535) at static_test.cpp:22
#2  0x0000555555555461 in _GLOBAL__sub_I_ready () at static_test.cpp:59
#3  0x0000555555556c0d in __libc_csu_init ()
#4  0x00007ffff7245b28 in __libc_start_main (main=0x55555555529b <main()>, argc=1, argv=0x7fffffffe4a8, init=0x555555556bc0 <__libc_csu_init>, fini=<optimized out>, rtld_fini=<optimized out>, stack_end=0x7fffffffe498) at ../csu/libc-start.c:266
#5  0x000055555555507a in _start ()
(gdb) c
Continuing.

[Switching to Thread 0x7ffff6684700 (LWP 17825)]

Thread 3 "a.out" hit Breakpoint 1, Foo::Foo (this=0x5555557590a0 <getStaticVar_2()::f>, i=305419896, ch=0x555555556c52 "local static") at static_test.cpp:16
16              mData = i;
(gdb) bt
#0  Foo::Foo (this=0x5555557590a0 <getStaticVar_2()::f>, i=305419896, ch=0x555555556c52 "local static") at static_test.cpp:16
#1  0x00005555555551b1 in getStaticVar_2 () at static_test.cpp:29
#2  0x0000555555555262 in thread_fun () at static_test.cpp:42
#3  0x0000555555555b83 in std::__invoke_impl<void, void (*)()> (__f=@0x55555576bfe8: 0x555555555204 <thread_fun()>) at /usr/include/c++/7/bits/invoke.h:60
#4  0x000055555555578f in std::__invoke<void (*)()> (__fn=@0x55555576bfe8: 0x555555555204 <thread_fun()>) at /usr/include/c++/7/bits/invoke.h:95
#5  0x0000555555556b4a in std::thread::_Invoker<std::tuple<void (*)()> >::_M_invoke<0ul> (this=0x55555576bfe8) at /usr/include/c++/7/thread:234
#6  0x0000555555556b06 in std::thread::_Invoker<std::tuple<void (*)()> >::operator() (this=0x55555576bfe8) at /usr/include/c++/7/thread:243
#7  0x0000555555556ad6 in std::thread::_State_impl<std::thread::_Invoker<std::tuple<void (*)()> > >::_M_run (this=0x55555576bfe0) at /usr/include/c++/7/thread:186
#8  0x00007ffff78ea6df in ?? () from /usr/lib/x86_64-linux-gnu/libstdc++.so.6
#9  0x00007ffff7bbd6db in start_thread (arg=0x7ffff6684700) at pthread_create.c:463
#10 0x00007ffff734588f in clone () at ../sysdeps/unix/sysv/linux/x86_64/clone.S:95

*/

/*
__cxa_guard_acquire
return 1: Initialize the static variable by current thread
return 0: the variable already initialized
Foo& getStaticVar_2()
   0x0000555555555185 <+30>:    callq  0x555555555030 <__cxa_guard_acquire@plt>
   0x000055555555518a <+35>:    test   %eax,%eax
   0x000055555555518c <+37>:    setne  %al
   0x000055555555518f <+40>:    test   %al,%al
   0x0000555555555191 <+42>:    je     0x5555555551d7 <getStaticVar_2()+112>
   0x0000555555555193 <+44>:    mov    $0x0,%r12d
   0x0000555555555199 <+50>:    lea    0x1ab2(%rip),%rdx        # 0x555555556c52
   0x00005555555551a0 <+57>:    mov    $0x12345678,%esi
   0x00005555555551a5 <+62>:    lea    0x203ef4(%rip),%rdi        # 0x5555557590a0 <_ZZ14getStaticVar_2vE1f>
   0x00005555555551ac <+69>:    callq  0x55555555559c <Foo::Foo(long, char const*)>
   0x00005555555551b1 <+74>:    lea    0x203f10(%rip),%rdi        # 0x5555557590c8 <_ZGVZ14getStaticVar_2vE1f>
=> 0x00005555555551b8 <+81>:    callq  0x555555554f50 <__cxa_guard_release@plt>
   0x00005555555551bd <+86>:    lea    0x203e44(%rip),%rdx        # 0x555555759008
   0x00005555555551c4 <+93>:    lea    0x203ed5(%rip),%rsi        # 0x5555557590a0 <_ZZ14getStaticVar_2vE1f>
   0x00005555555551cb <+100>:   lea    0x464(%rip),%rdi        # 0x555555555636 <Foo::~Foo()>
   0x00005555555551d2 <+107>:   callq  0x555555554f60 <__cxa_atexit@plt>
   0x00005555555551d7 <+112>:   lea    0x203ec2(%rip),%rax        # 0x5555557590a0 <_ZZ14getStaticVar_2vE1f>
   0x00005555555551de <+119>:   jmp    0x5555555551ff <getStaticVar_2()+152>
   0x00005555555551e0 <+121>:   mov    %rax,%rbx
   0x00005555555551e3 <+124>:   test   %r12b,%r12b
   0x00005555555551e6 <+127>:   jne    0x5555555551f4 <getStaticVar_2()+141>
   0x00005555555551e8 <+129>:   lea    0x203ed9(%rip),%rdi        # 0x5555557590c8 <_ZGVZ14getStaticVar_2vE1f>
   0x00005555555551ef <+136>:   callq  0x555555554f40 <__cxa_guard_abort@plt>

*/
