#include <immintrin.h>
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <signal.h>
#include <sys/ucontext.h>

typedef void (*sa_sigaction_type)(int, siginfo_t *, void *);
void setHandler(sa_sigaction_type handler)
{
    struct sigaction action;
    action.sa_flags = SA_SIGINFO | SA_NODEFER;
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

void ResolveAlignError(int signo, siginfo_t *info, void* extra)
{
    ucontext_t *p = (ucontext_t*) extra;
    char* faultAddr = reinterpret_cast<char*>(info->si_addr);
    auto x = p->uc_mcontext.gregs[REG_RIP];
    printf("Enter signal handler signal=%d received\n", signo);
    printf("Got SIGSEGV at addr=%p errno=%d, code=%d\n", faultAddr, info->si_errno, info->si_code);
    printf("Instruction addr=0x%llX =>%x\n", x, *(int*)(x));

    auto rax = p->uc_mcontext.gregs[REG_RAX];
    float* float_data_addr = (float*)(rax);
    printf("float data addr=%p %f %f %f %f\n", float_data_addr, float_data_addr[0], float_data_addr[1], float_data_addr[2], float_data_addr[3]);

    //1. Copy 128bit to xmm0
    auto &xmm = p->uc_mcontext.fpregs->_xmm;
    memcpy(&xmm[0], float_data_addr, 16);

    //2. Copy another 128bit to top-half of ymm0
    //memcpy((char*)(p->uc_mcontext.fpregs)+576, float_data_addr+4, 16);
    auto p_xstate = (_xstate*)(p->uc_mcontext.fpregs);
    auto ymm0_hi_addr= (float*) (p_xstate->ymmh.ymmh_space);
    memcpy(ymm0_hi_addr, float_data_addr+4, 16);
    ymm0_hi_addr[3] = 8.8;
    printf("gap=%ld: %f %f %f %f\n",(char*)ymm0_hi_addr-(char*)p->uc_mcontext.fpregs, ymm0_hi_addr[0], ymm0_hi_addr[1], ymm0_hi_addr[2], ymm0_hi_addr[3]);

    constexpr unsigned int NextInstOff = 4;
    auto& rip = p->uc_mcontext.gregs[REG_RIP];
    rip = rip+NextInstOff;
}

float float_array[32];
int main() {
  setHandler(ResolveAlignError);

  float* aligned_floats  = (float*)((long)(void*)float_array &(~31l));
  __asm__ __volatile__("vmovaps %0, %%ymm1\n"  : : "m"(*aligned_floats) ); //YMM0 top-half can't restore without this line!!!!!!!!!!!!!!!!
  //__asm__ __volatile__("vmovaps %0, %%xmm1\n"  : : "m"(*aligned_floats)  );
  //__asm__ __volatile__("vzeroupper");
  //__asm__ __volatile__("vzeroall");

  float* unaligned_floats = float_array+1;
  unaligned_floats[0] = 1.1;
  unaligned_floats[1] = 2.2;
  unaligned_floats[4] = 5.5;
  unaligned_floats[7] = 8.8;
  char vec[256];
  float* f = (float*)(void*)vec;
  __asm__ __volatile__(
    "mov %1, %%rax\n"
    "vmovaps (%%rax), %%ymm0\n"
    "vmovups %%ymm0, %0\n"
    : "=m" (*f)
    : "m" (unaligned_floats)
    : "%rax"
  );
  printf("\nReturn to main:\n");
  printf("%f %f %f %f %f %f %f %f\n", f[0], f[1], f[2], f[3], f[4], f[5], f[6], f[7]);
  return 0;
}
