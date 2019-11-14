#include <fcntl.h>
#include <signal.h>
#include <stdio.h>
#include <string.h>
#include <sys/mman.h>
#include <sys/stat.h>
#include <sys/types.h>
#include <unistd.h>

#include <sys/ucontext.h>
#include <ucontext.h>

auto pagesize = sysconf(_SC_PAGE_SIZE);
typedef void (*sa_sigaction_type)(int, siginfo_t *, void *);

int main()
{}
