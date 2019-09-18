#include <signal.h>
#include <stdio.h>
#include <execinfo.h>

 #define BT_BUF_SIZE 32

void bt (void)
{
    int j, nptrs;
    void *buffer[BT_BUF_SIZE];
    char **strings;

    nptrs = backtrace(buffer, BT_BUF_SIZE);
    backtrace_symbols_fd(buffer, nptrs, 1);
}

void myfunc(int ncalls)
{
    if (ncalls > 1)
        myfunc(ncalls - 1);
}


void signal_handler(int signum)
{
    bt();
    printf("Catch signal %d\n", signum);
}



int main()
{
    signal(SIGINT, signal_handler);
    //guarantee libgcc is loaded before signal handler
    bt();
    while(1)
        myfunc(12);
}
