#include <immintrin.h>
#include <stdio.h>
#include <fcntl.h>
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

#define TOTAL_SIZE  (32*pagesize)
void ResolveAlignError(int signo, siginfo_t *info, void* extra)
{
    ucontext_t *p = (ucontext_t*) extra;
    char* faultAddr = reinterpret_cast<char*>(info->si_addr);
    printf("Enter signal handler signal=%d received\n", signo);
    printf("Got SIGSEGV at addr=%p errno=%d, code=%d\n", faultAddr, info->si_errno, info->si_code);
    auto x = p->uc_mcontext.gregs[REG_RIP];
    printf("Instruction addr=0x%llX =>%x\n", x, *(int*)(x));

    auto rax = p->uc_mcontext.gregs[REG_RAX];
    float* float_data_addr = (float*)(rax)+1;

/*
TODO: Analyze the opcode of faulted instruction.
  1. xmm is used in some compiler, rather YMM
  2. if no offset to (%rax), 4Byte is enough
=> 0x000055555555478d <+77>:    vmovaps 0x4(%rax),%ymm0
   0x0000555555554792 <+82>:    xor    %eax,%eax
   0x0000555555554794 <+84>:    vmovaps %ymm0,-0x30(%rbp)
*/
    auto &xmm = p->uc_mcontext.fpregs->_xmm;
    memcpy(&xmm[0], float_data_addr, 16);
    //memcpy((char*)(p->uc_mcontext.fpregs)+576, float_data_addr+4, 16);

    auto p_xstate = (_xstate*)(p->uc_mcontext.fpregs);
    auto ymm0_hi_addr= (float*) (p_xstate->ymmh.ymmh_space);
    memcpy(ymm0_hi_addr, float_data_addr+4, 16);
    ymm0_hi_addr[3] = 8.8;
    printf("gap=%ld:%f %f %f %f\n",(char*)ymm0_hi_addr-(char*)p->uc_mcontext.fpregs, ymm0_hi_addr[0], ymm0_hi_addr[1], ymm0_hi_addr[2], ymm0_hi_addr[3]);

    constexpr unsigned int NextInstOff = 5;
    auto& rip = p->uc_mcontext.gregs[REG_RIP];
    rip = rip+NextInstOff;
}
int main() {
  setHandler(ResolveAlignError);
  float* f = nullptr;

  //__m256 init = _mm256_set_ps(0, 0, 0, 0, 0, 0, 0, 0);

/*
unaligned_floats   -> YMM0
YMM0 -> vec  int32 [8]
*/
  float* unaligned_floats = (float*)malloc(128 * sizeof(float))+1;
  unaligned_floats[0] = 1.0;
  unaligned_floats[1] = 1.1;
  unaligned_floats[2] = 1.2;
  unaligned_floats[3] = 1.3;
  unaligned_floats[4] = 1.4;
  unaligned_floats[5] = 1.5;
  unaligned_floats[6] = 1.6;
  unaligned_floats[7] = 1.7;
  __m256 vec = _mm256_load_ps(unaligned_floats); //32B align requirement
  f = (float*)&vec;
  printf("\nReturn to main:\n");
  printf("%f %f %f %f %f %f %f %f\n", f[0], f[1], f[2], f[3], f[4], f[5], f[6], f[7]);
  return 0;
}
