/*
  1. CPUID.0A => get the number of general-purpose && fixed-function performance counters
  2. wrmsr 0x186 IA32_PERFEVTSEL0   -> Set the target Event number and and Unit Mask(EventNumber+Umask can determint the unique "performance Event") for general purpose event
     wrmsr 0x187 IA32_PERFEVTSEL1
     wrmsr 0x38d IA32_FIXED_CTR_CTRL ->  
     wrmsr 0x38F IA32_PERF_GLOBAL_CTRL -> enable the Fixed and general-purposed
  3. rdpmc
0x186 is the index of Register that is 64-bit
	wrmsr -p $core 0x186 0x004301a1  //01a1 Cycles which uop is dispatched to port 0
	wrmsr -p $core 0x187 0x004302a1
	wrmsr -p $core 0x188 0x004304a1

	rdmsr -p $core -x 0x38f
	wrmsr -p $core 0x38f 0x00000007000000ff  //0xFF 8 general-purpose event counters; 0x7 Fixed-function enable
*/
/*
Read performance-monitoring counter specified by ECX into EDX:EAX.

General-purpose or special-purpose performance counters are specified with ECX[30] = 0: The number of general-purpose performance counters on processor supporting architectural performance monitoring are reported by CPUID 0AH leaf. The availability of special-purpose counters, as well as the number of general-purpose counters if the processor does not support architectural performance monitoring, is model specific;

Fixed-function performance counters are specified with ECX[30] = 1. The number fixed-function performance counters is enumerated by CPUID 0AH leaf.
*/
#include <stdio.h>
#include "../../../Utils/affinity.hpp"
#include "../rdpmc.hpp"


int main()
{
  SetAffinity(3);
  auto start = rdpmc_instructions();
  auto ref_cycles_start = rdpmc_reference_cycles();
  auto llc_ref = rdpmc(0);
  auto llc_miss = rdpmc(1);
  auto branch_ref = rdpmc(2);
  auto branch_miss = rdpmc(3);
  printf("%ld\n", rdpmc(0));
  printf("%ld\n", rdpmc(1));
  printf("%ld\n", rdpmc(2));
  printf("%ld\n", rdpmc(3));
  printf("%ld\n", rdpmc(4));

  for(int i=0; i<1000; i++)
  for(int j=0; j<100000; j++)
#if 1
  for(int k=0; k<90; k++)
#else
  for(int k=0; k<10; k++)
#endif
        ;
  printf("%ld instructions retired, %lfM reference cycles(IPC=%lf)\n, %ld llc reference, %ld llc misses\n %ld branch insturctions, %ld branch-miss (%lf)\n",
             rdpmc_instructions()-start, (rdpmc_reference_cycles()-ref_cycles_start)*1.0/1000000, (rdpmc_instructions()-start)*1.0/(rdpmc_reference_cycles()-ref_cycles_start),
             rdpmc(0)-llc_ref, rdpmc(1)-llc_miss, rdpmc(2)-branch_ref, rdpmc(3)-branch_miss, (rdpmc(3)-branch_miss)*1.0/(rdpmc(2)-branch_ref));
}
