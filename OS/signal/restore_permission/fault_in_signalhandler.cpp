#include <fcntl.h>
#include <signal.h>
#include <stdio.h>
#include <string.h>
#include <sys/mman.h>
#include <sys/stat.h>
#include <sys/types.h>
#include <unistd.h>
#include <execinfo.h>
#include <stdlib.h>
#include <signal.h>
#include <malloc.h>

#include <sys/ucontext.h>
#include <ucontext.h>

auto pagesize = sysconf(_SC_PAGE_SIZE);
char* buffer = nullptr;
typedef void (*sa_sigaction_type)(int, siginfo_t *, void *);

void setHandler(sa_sigaction_type handler)
{
    struct sigaction action;
/*
SA_NODEFER
    Do not prevent the signal from being received from within its own signal handler.
    This flag is meaningful only when establishing a signal handler.  SA_NOMASK is an obsolete, nonstandard synonym for this flag.
*/
#ifdef NO_BLOCK_SIGNAL_IN_CURRENT_HANDLER
    action.sa_flags = SA_SIGINFO | SA_NODEFER;
#else
    //when SIGSEG is triggered in its handler, because SIGSEG is blocked in user defined  handler
    //so, default handler is called
    action.sa_flags = SA_SIGINFO;
#endif
	sigemptyset(&action.sa_mask);
    action.sa_sigaction = handler;

    if (sigaction(SIGSEGV, &action, NULL) == -1)
    {
        perror("Failed to install SIGSEGV\n");
        exit(-1);
    }
}

void restoreHandler()
{
    struct sigaction action;
    action.sa_flags = SA_NOCLDSTOP;
    action.sa_handler= SIG_DFL;

    if (sigaction(SIGSEGV, &action, NULL) == -1)
    {
        perror("Failed to restore SIGSEGV\n");
        exit(-1);
    }
}

#define TOTAL_SIZE  (32*pagesize)
void PermissionGuard(int signo, siginfo_t *info, void* extra)
{
    ucontext_t *p = (ucontext_t*) extra;
    char* faultAddr = reinterpret_cast<char*>(info->si_addr);
    printf("Signal %d received\n", signo);
    printf("Got SIGSEGV at addr=%p errno=%d, code=%d\n", faultAddr, info->si_errno, info->si_code);
    auto x = p->uc_mcontext.gregs[REG_RIP];
    printf("Instruction addr=0x%llX\n\n", x);

    mprotect(faultAddr, pagesize, PROT_READ|PROT_WRITE);

    //The SIGSEG handler is always SIG_DFL during signal handler is called
    setHandler(PermissionGuard);
    *(char*)0 = '\b';
    printf("Never run here!!!\n");
}

void bt(void)
{
    #define SIZE 10
	void *buffer[SIZE];
	char **strings;
	int n, i;

	n = backtrace(buffer, SIZE);

	strings = backtrace_symbols(buffer, n);

	for (i = 0; i < n; i++) {
		printf("%s\n", strings[i]);
	}

	free(strings);

	exit(EXIT_FAILURE);
}


int main()
{
    setHandler(PermissionGuard);
    buffer = reinterpret_cast<char*> (memalign(pagesize, TOTAL_SIZE));
    if(buffer == NULL)
        perror("memalign");
    else
        printf("buffer=%p\n\n", buffer);

    if(mprotect(buffer+pagesize*2, pagesize, PROT_NONE) == -1)
        perror("mprotect");
    if(mprotect(buffer+pagesize*6, pagesize, PROT_NONE) == -1)
        perror("mprotect");

    for(auto p=buffer; p < buffer+TOTAL_SIZE;)
        *(p++) = 'a';
    printf("Done\n");
}
