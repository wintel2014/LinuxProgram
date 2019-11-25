#include <unistd.h>
#include <chrono>
#include <thread>
#include <iostream>
#include <stdlib.h>
#include <sys/resource.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
/*
<1> Get rlimit of stack before main
    nptl-init.c
    465   __default_pthread_attr.stacksize = limit.rlim_cur;
    466   __default_pthread_attr.guardsize = GLRO (dl_pagesize);
    
    (gdb) bt
    #0  __GI___getrlimit64 (resource=resource@entry=RLIMIT_STACK, rlimits=rlimits@entry=0x7fffffffe3b0) at ../sysdeps/unix/sysv/linux/getrlimit64.c:37
    #1  0x00007ffff7bbc058 in __pthread_initialize_minimal_internal () at nptl-init.c:417
    #2  0x00007ffff7bbb681 in _init () at ../sysdeps/x86_64/crti.S:72
    #3  0x0000000000000000 in ?? ()

<2> Allocate vma for each thread's stack
    b allocate_stack then b mmap
    #0  __GI___mmap64 (addr=addr@entry=0x0, len=len@entry=8392704, prot=prot@entry=0, flags=flags@entry=131106, fd=fd@entry=-1, offset=offset@entry=0) at ../sysdeps/unix/sysv/linux/mmap64.c:44
    #1  0x00007ffff7bbe116 in allocate_stack (stack=<synthetic pointer>, pdp=<synthetic pointer>, attr=0x7fffffffc230) at allocatestack.c:563
    #2  __pthread_create_2_1 (newthread=0x7fffffffc328, attr=0x0, start_routine=0x7ffff78ea660, arg=0x55555576b280) at pthread_create.c:644
    #3  0x00007ffff78ea925 in std::thread::_M_start_thread(std::unique_ptr<std::thread::_State, std::default_delete<std::thread::_State> >, void (*)()) () from /usr/lib/x86_64-linux-gnu/libstdc++.so.6
    #4  0x0000555555555b8b in std::thread::thread<void (&)()> (this=0x7fffffffc328, __f=@0x555555554fca: {void (void)} 0x555555554fca <thread_fun()>) at /usr/include/c++/7/thread:126
    #5  0x0000555555555163 in main (argc=1, argv=0x7fffffffe4e8) at stack_limit.cpp:32
    
    allocatestack.c
    511       mem = mmap (NULL, size, prot, MAP_PRIVATE | MAP_ANONYMOUS | MAP_STACK, -1, 0);

<3> pthread_create calls clone to create new thread. it has to provide the child stack. i.e the stack is allocated in glibc rather than kernel.
 int clone(int (*fn)(void *), void *child_stack, int flags, void *arg, ...);
    #0  clone () at ../sysdeps/unix/sysv/linux/x86_64/clone.S:52
    #1  0x00007ffff7bbdec5 in create_thread (thread_ran=<synthetic pointer>, stackaddr=0x7ffff6e84fc0, stopped_start=<synthetic pointer>, attr=0x7fffffffc230, pd=0x7ffff6e85700) at ../sysdeps/unix/sysv/linux/createthread.c:100
    #2  __pthread_create_2_1 (newthread=<optimized out>, attr=<optimized out>, start_routine=<optimized out>, arg=0x55555576b280) at pthread_create.c:797
    #3  0x00007ffff78ea925 in std::thread::_M_start_thread(std::unique_ptr<std::thread::_State, std::default_delete<std::thread::_State> >, void (*)()) () from /usr/lib/x86_64-linux-gnu/libstdc++.so.6
    #4  0x0000555555555b8b in std::thread::thread<void (&)()> (this=0x7fffffffc328, __f=@0x555555554fca: {void (void)} 0x555555554fca <thread_fun()>) at /usr/include/c++/7/thread:126
    #5  0x0000555555555163 in main (argc=1, argv=0x7fffffffe4e8) at stack_limit.cpp:32

*/


void thread_fun() noexcept
{
//The limit only impacts the VMA, not rlimit for per-thread
    char a[7*1024*1024];
    a[7*1024*1024-1] = 'a';
    while(true)
        std::this_thread::sleep_for(std::chrono::milliseconds(10));
}


int main(int argc, char* argv[])
{
    auto fd = open("/proc/self/limits", O_RDONLY);
    char buff[2*4096];
    std::cout<<"/proc/self/limits\n";
    buff[read(fd, buff, sizeof(buff))] ='\0';
    std::cout<<buff<<"\n\n";

    struct rlimit stack_limit;
    getrlimit(RLIMIT_STACK, &stack_limit);
    std::cout<<"Soft:"<<stack_limit.rlim_cur<<" Hard:"<<stack_limit.rlim_max<<"\n";
    stack_limit.rlim_cur = 2*1024*1024;
    if(setrlimit(RLIMIT_STACK, &stack_limit) < 0) //Because the stack limit is initialized before main this call doesn't matter with non-main-thread's stack.
        std::cout<<"Failed to set stack limit\n";

    std::thread T[11];
    for(auto& t:T)
        t = std::thread(thread_fun);

    //fd = open("/proc/self/limits", O_RDONLY);
    lseek(fd, 0, SEEK_SET);
    std::cout<<"/proc/self/limits\n";
    buff[read(fd, buff, sizeof(buff))] ='\0';
    std::cout<<buff<<"\n\n";

    std::cout<<"/proc/self/maps\n";
    fd = open("/proc/self/maps", O_RDONLY);
    buff[read(fd, buff, sizeof(buff))] ='\0';
    std::cout<<buff<<"";
    buff[read(fd, buff, sizeof(buff))] ='\0';
    std::cout<<buff<<"\n\n";
    for(auto& t:T)
        t.join();

    return 0;
}
