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
#include <atomic>

#include <sys/ucontext.h>
#include <ucontext.h>
auto pagesize = sysconf(_SC_PAGE_SIZE);
char* buffer = nullptr;
typedef void (*sa_sigaction_type)(int, siginfo_t *, void *);

std::atomic<int> gCount{0};

void SigHandler(int signo, siginfo_t *info, void* extra)
{
    gCount ++;
    
    int index = gCount.load();
    ucontext_t *p = (ucontext_t*) extra;
    char* faultAddr = reinterpret_cast<char*>(info->si_addr);
    printf("[%d] Signal %d received\n",index, signo);
    printf("[%d] Got %d at addr=%p errno=%d, code=%d, sendBy=%u\n",index, signo, faultAddr, info->si_errno, info->si_code, info->si_pid);
    auto x = p->uc_mcontext.gregs[REG_RIP];
    printf("[%d] Instruction addr=0x%llX\n", index, x);

    int delay =8;
    printf("[%d] Sleep %d seconds in sighand %d\n", index, delay, signo);
    usleep(delay*1000*1000);
    printf("[%d] Wake in sighand %d\n\n", index, signo);
}

void SigHandlerNB(int signo, siginfo_t *info, void* extra)
{
    ucontext_t *p = (ucontext_t*) extra;
    char* faultAddr = reinterpret_cast<char*>(info->si_addr);
    printf("Signal %d received\n", signo);
    printf("Got %d at addr=%p errno=%d, code=%d, sendBy=%u\n", signo, faultAddr, info->si_errno, info->si_code, info->si_pid);
    auto x = p->uc_mcontext.gregs[REG_RIP];
    printf("Instruction addr=0x%llX\n\n", x);
}

void setHandler(int signum, sa_sigaction_type handler, int mask=0, int flags = 0)
{
    struct sigaction action;
    action.sa_flags = SA_SIGINFO;
    if(flags)
        action.sa_flags |= flags;
    sigemptyset(&action.sa_mask);
    if (mask)
        sigaddset(&action.sa_mask, mask);
    action.sa_sigaction = handler;

    if (sigaction(signum, &action, NULL) == -1)
    {
        perror("Failed to install SIGSEGV\n");
        exit(-1);
    }
}

void restoreHandler(int signo)
{
    struct sigaction action;
    action.sa_flags = SA_NOCLDSTOP;
    action.sa_handler= SIG_DFL;

    if (sigaction(signo, &action, NULL) == -1)
    {
        perror("Failed to restore SIGSEGV\n");
        exit(-1);
    }
}


/*
kill -l
 1) SIGHUP       2) SIGINT       3) SIGQUIT      4) SIGILL       5) SIGTRAP
 6) SIGABRT      7) SIGBUS       8) SIGFPE       9) SIGKILL     10) SIGUSR1
11) SIGSEGV     12) SIGUSR2     13) SIGPIPE     14) SIGALRM     15) SIGTERM
16) SIGSTKFLT   17) SIGCHLD     18) SIGCONT     19) SIGSTOP     20) SIGTSTP
21) SIGTTIN     22) SIGTTOU     23) SIGURG      24) SIGXCPU     25) SIGXFSZ
26) SIGVTALRM   27) SIGPROF     28) SIGWINCH    29) SIGIO       30) SIGPWR
31) SIGSYS      34) SIGRTMIN    35) SIGRTMIN+1  36) SIGRTMIN+2  37) SIGRTMIN+3
38) SIGRTMIN+4  39) SIGRTMIN+5  40) SIGRTMIN+6  41) SIGRTMIN+7  42) SIGRTMIN+8
43) SIGRTMIN+9  44) SIGRTMIN+10 45) SIGRTMIN+11 46) SIGRTMIN+12 47) SIGRTMIN+13
48) SIGRTMIN+14 49) SIGRTMIN+15 50) SIGRTMAX-14 51) SIGRTMAX-13 52) SIGRTMAX-12
53) SIGRTMAX-11 54) SIGRTMAX-10 55) SIGRTMAX-9  56) SIGRTMAX-8  57) SIGRTMAX-7
58) SIGRTMAX-6  59) SIGRTMAX-5  60) SIGRTMAX-4  61) SIGRTMAX-3  62) SIGRTMAX-2
63) SIGRTMAX-1  64) SIGRTMAX
*/
/*
profiled by strace

rt_sigaction(SIGUSR1, {sa_handler=0x55db8ab1ba0a, sa_mask=[], sa_flags=SA_RESTORER|SA_NODEFER|SA_SIGINFO, sa_restorer=0x7fc2804d7f20}, NULL, 8) = 0
rt_sigaction(SIGUSR2, {sa_handler=0x55db8ab1ba0a, sa_mask=[], sa_flags=SA_RESTORER|SA_SIGINFO, sa_restorer=0x7fc2804d7f20}, NULL, 8) = 0
rt_sigaction(SIGRT_2, {sa_handler=0x55db8ab1bb3a, sa_mask=[], sa_flags=SA_RESTORER|SA_SIGINFO, sa_restorer=0x7fc2804d7f20}, NULL, 8) = 0
rt_sigaction(SIGURG,  {sa_handler=0x55db8ab1ba0a, sa_mask=~[RTMIN RT_1], sa_flags=SA_RESTORER|SA_SIGINFO, sa_restorer=0x7fc2804d7f20}, NULL, 8) = 0
*/
/*
SA_NODEFER
       Do not prevent the signal from being received from within its own signal handler.  This flag is meaningful only when establishing a signal handler.  SA_NOMASK is an obsolete, nonstandard synonym for this flag.

SA_ONSTACK
       Call the signal handler on an alternate signal stack provided by sigaltstack(2).  If an alternate stack is not available, the default stack will be used.  This flag is meaningful only when  establishing  a  signal
       handler.
*/

int main()
{
// sa_mask=0: all other signals can interrupt SIGUSR1
// SA_NODEFER: SIGUSR1 can be interrupted during SIGUSR1 signal handler
    setHandler(SIGUSR1, SigHandler, 0, SA_NODEFER);

//SIGUSR2 cant be interrupted by itself due to without SA_NODEFER
    setHandler(SIGUSR2, SigHandler);

    setHandler(SIGRTMIN, SigHandlerNB);

//SIGURG cant be interrupted by any
    struct sigaction action;
    action.sa_flags = SA_SIGINFO;
    sigfillset(&action.sa_mask);
    action.sa_sigaction = SigHandler;
    sigaction(SIGURG, &action, NULL);

    printf("%d is running\n", getpid());
    printf("\tSIGUSR1 can be interrupted by any signal\n\tSIGUSR2 cant be interrupted by itself\n\tSIGURG cant be interrupted by any\n");
    printf("[SIGHUP, SIGSYS] only queue once, [SIGRTMIN, SIGRTMAX] can be queued multitimes\n");
    printf("Please try the following cmd:\n");
    printf("kill -s SIGUSR1 %d\n", getpid());
    printf("kill -s SIGUSR2 %d\n", getpid());
    printf("kill -s SIGURG %d\n", getpid());
    printf("kill -s SIGRTMIN %d\n", getpid());
    printf("kill -s SIGUSR1 %d && sleep 1 && kill -s SIGUSR2 %d && sleep 1 && kill -s SIGURG %d\n", getpid(), getpid(), getpid());
    while(1) usleep(50*1000);
}
