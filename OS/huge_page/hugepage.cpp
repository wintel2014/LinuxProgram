/*
2 ways to acheive huge pages.
1. mmap(MAP_HUGETLB) only HUGE page can be allocated, MAP_FAILED is returned if not enough
the length in mmap cant beyond /proc/sys/vm/nr_hugepages

2. madvise(MADV_HUGEPAGE) it works against THP. if always stored in "/sys/kernel/mm/transparent_hugepage/enabled", all VMA is tried on HUGE page. if failed, it fallback to normal page
    if advise stored, only MADV_HUGEPAGE can be allocated huge page.
    /sys/kernel/mm/transparent_hugepage/enabled
    [always] madvise never

https://elixir.bootlin.com/linux/v4.15-rc9/source/mm/memory.c#L4101
	if (unlikely(is_vm_hugetlb_page(vma))) //vma->vm_flags & VM_HUGETLB
		ret = hugetlb_fault(vma->vm_mm, vma, address, flags);
	else
		ret = __handle_mm_fault(vma, address, flags);// will try THP, if failed fallback to normal page

https://elixir.bootlin.com/linux/v4.15-rc9/source/mm/memory.c#L4037
	if (pmd_none(*vmf.pmd) && transparent_hugepage_enabled(vma)) {
		ret = create_huge_pmd(&vmf);
		if (!(ret & VM_FAULT_FALLBACK))
			return ret;
	} else {


https://elixir.bootlin.com/linux/v4.15-rc9/source/mm/huge_memory.c#L148
static ssize_t enabled_show(struct kobject *kobj,
			    struct kobj_attribute *attr, char *buf)
{
	if (test_bit(TRANSPARENT_HUGEPAGE_FLAG, &transparent_hugepage_flags))
		return sprintf(buf, "[always] madvise never\n");
	else if (test_bit(TRANSPARENT_HUGEPAGE_REQ_MADV_FLAG, &transparent_hugepage_flags))
		return sprintf(buf, "always [madvise] never\n");
	else
		return sprintf(buf, "always madvise [never]\n");
}

static inline bool transparent_hugepage_enabled(struct vm_area_struct *vma)
{
	if (vma->vm_flags & VM_NOHUGEPAGE)
		return false;
......

	if (transparent_hugepage_flags & (1 << TRANSPARENT_HUGEPAGE_FLAG)) // /sys/kernel/mm/transparent_hugepage/enabled ==> [always]
		return true;
......
	if (transparent_hugepage_flags & (1 << TRANSPARENT_HUGEPAGE_REQ_MADV_FLAG)) // /sys/kernel/mm/transparent_hugepage/enabled ==> [madvise]
		return !!(vma->vm_flags & VM_HUGEPAGE);

	return false;
}



MADV_HUGEPAGE (since Linux 2.6.38)
 Enable Transparent Huge Pages (THP) for pages in the range specified by addr and length.  Currently, Transparent Huge Pages work only with private anonymous pages (see mmap(2)).  The kernel  will  regularly  scan  the
 areas marked as huge page candidates to replace them with huge pages.  The kernel will also allocate huge pages directly when the region is naturally aligned to the huge page size (see posix_memalign(2)).

 This  feature is primarily aimed at applications that use large mappings of data and access large regions of that memory at a time (e.g., virtualization systems such as QEMU).  It can very easily waste memory (e.g., a
 2 MB mapping that only ever accesses 1 byte will result in 2 MB of wired memory instead of one 4 KB page).  See the Linux kernel source file Documentation/vm/transhuge.txt for more details.

 The MADV_HUGEPAGE and MADV_NOHUGEPAGE operations are available only if the kernel was configured with CONFIG_TRANSPARENT_HUGEPAGE.

MADV_NOHUGEPAGE (since Linux 2.6.38)
 Ensures that memory in the address range specified by addr and length will not be collapsed into huge pages.

*/
#include "../../Utils/sysconf.h"
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

#include <fstream>
#include <string>

typedef void (*sa_sigaction_type)(int, siginfo_t *, void *);
typedef const char* (*sig_code_reason_type)(int);
const char* SIGBUS_reason(int si_code)
{
    switch(si_code)
    {
        case   BUS_ADRALN:
                return  "Invalid address alignment";

        case   BUS_ADRERR:
                return  "Nonexistent physical address";

        case   BUS_OBJERR:
                return "Object-specific hardware error";

        case   BUS_MCEERR_AR:
                return "Hardware memory error consumed on a machine check; action required";

        case    BUS_MCEERR_AO:
                return  "Hardware memory error detected in process but not consumed; action optional";
        
        default:
                return "Unknown code";
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

void SigHandler(int signo, siginfo_t *info, void* extra)
{
    ucontext_t *p = (ucontext_t*) extra;
    char* faultAddr = reinterpret_cast<char*>(info->si_addr);
    printf("Signal %d received\n", signo);
    if (signo == SIGBUS)
        printf("Got %d at addr=%p errno=%d, code=%d [%s], sendBy=%u\n", signo, faultAddr, info->si_errno, info->si_code, SIGBUS_reason(info->si_code), info->si_pid);
    else
        printf("Got %d at addr=%p errno=%d, code=%d, sendBy=%u\n", signo, faultAddr, info->si_errno, info->si_code, info->si_pid);
    auto x = p->uc_mcontext.gregs[REG_RIP];
    printf("Instruction addr=0x%llX\n\n", x);
    restoreHandler(signo);
}

void setHandler(int signum, sa_sigaction_type handler)
{
    struct sigaction action;
    action.sa_flags = SA_SIGINFO;
    sigemptyset(&action.sa_mask);
    action.sa_sigaction = handler;

    if (sigaction(signum, &action, NULL) == -1)
    {
        perror("Failed to install SIGSEGV\n");
        exit(-1);
    }
}



static size_t HUGE_PAGE_SIZE = 512l*PAGESIZE;
#define msleep(count) usleep((count)*1000)

#include <iostream>
#include <array>
#include <sstream>
bool isHugePageMapped(void* start, void* end)
{
  std::string CurrentSmapsFile = "/proc/self/smaps";
  std::ifstream smapsStream(CurrentSmapsFile);
  if(!smapsStream.is_open())
  {
    printf("Failed to open %s\n", CurrentSmapsFile.c_str());
    return false;
  }
  std::array<char, 32>  rangeL;
  std::array<char, 32>  rangeR;
  std::array<char, 2048> line; 
  while (smapsStream.getline(&line[0], sizeof(line)) )
  {
    std::istringstream vmBuf(&line[0]);
    vmBuf.getline(&rangeL[0], sizeof(rangeL), '-');
    vmBuf.getline(&rangeR[0], sizeof(rangeR), ' ');
    auto rangeLPtr = reinterpret_cast<void*>(std::stoull(&rangeL[0], 0, 16));
    auto rangeRPtr = reinterpret_cast<void*>(std::stoull(&rangeR[0], 0, 16));
    std::array<char, 128> FieldName; 
    std::array<char, 128> Value; 
    while(smapsStream.getline(&line[0], sizeof(line)))
    {
      long long AnonHugePagesSize = 0;
      std::istringstream inbuf(&line[0]);
      const std::string targetField("AnonHugePages");
      const std::string endField("VmFlags");
      inbuf.getline(&FieldName[0], sizeof(FieldName), ':');
      {
          if(targetField == &FieldName[0])
          {
              inbuf.getline(&Value[0], sizeof(Value), 'k');
              auto AnonHugePagesSize = std::stoull(&Value[0], 0, 16);
              if(rangeLPtr<=start && end<=rangeRPtr)
              {
                if(AnonHugePagesSize > 0)
                  return true;
              }
          }
          if(endField == &FieldName[0])
          {
              inbuf.getline(&Value[0], sizeof(Value));
              if(rangeLPtr<=start && end<=rangeRPtr)
              {
                if(std::string(&Value[0]).find(" ht") != std::string::npos)  
                  return true;
                printf("%18p %18p  AnonHugePages %lld kB\n",rangeLPtr, rangeRPtr, AnonHugePagesSize);
              }
              break;
          }
      }
    }
  }
  return false;
}

//#define USE_THP
int main(int argc, char* argv[])
{
    if(argc != 2)
    {
        printf("Input HugePage number\n");
        return -1;
    }

    int pages = atoi(argv[1]);

    static size_t mapLen = pages*HUGE_PAGE_SIZE;
#ifdef USE_THP
    char* addr  = static_cast<char*>(mmap(nullptr, mapLen, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, 0, 0));
    madvise(addr, mapLen, MADV_HUGEPAGE);
#else
//The hugepage is reserved for father process
//when COW child will receive SIGBUS if hugepage is not enough
    char* addr  = static_cast<char*>(mmap(nullptr, mapLen, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS|MAP_HUGETLB, 0, 0));
#endif
    if (addr == MAP_FAILED)
    {
        printf("Failed to mmap:%s\n", strerror(errno));
        return -1;
    }

    setHandler(SIGBUS, SigHandler);
    int pid = fork();
    if(pid < 0)
    {
        printf("Failed to fork:%s\n", strerror(errno));
        return -1;
    }
    else if(pid>0)
        printf("Father ID=%d; Child ID=%d\n",getpid(), pid);

    for(size_t off=0; off<mapLen; off+=HUGE_PAGE_SIZE)
    {
        if(pid>0)
            printf("Father[%d]: touch %p\n", getpid(), addr+off);
        else
            printf("Child [%d]: touch %p\n", getpid(), addr+off);
        addr[off] = off; 

        if (!isHugePageMapped(addr, addr+off))
        {
          printf("Failed to map [%p, %p] to hugepage\n", addr, addr+off);
        }
        msleep(50);
    }

    if(pid > 0)
    {
        int wstatus;
        auto w = wait(&wstatus);
        if (w == -1) {
            printf ("failed to wait()");
        }

        if (WIFEXITED(wstatus)) {
            printf("exited, status=%d\n", WEXITSTATUS(wstatus));
        } else if (WIFSIGNALED(wstatus)) {
            printf("killed by signal %d\n", WTERMSIG(wstatus));
        } else if (WIFSTOPPED(wstatus)) {
            printf("stopped by signal %d\n", WSTOPSIG(wstatus));
        } else if (WIFCONTINUED(wstatus)) {
            printf("continued\n");
        }
    }
#define DEBUG 
#ifdef DEBUG
    while(1)
        msleep(500);
#endif
}
