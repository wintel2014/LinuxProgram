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
#include <stdio.h>
#include "../../Utils/affinity.hpp"
// rdpmc_instructions uses a "fixed-function" performance counter to return the count of retired instructions on
//       the current core in the low-order 48 bits of an unsigned 64-bit integer.
unsigned long rdpmc_instructions()
{
   unsigned a, d, c;

   c = (1<<30);
   __asm__ volatile("rdpmc" : "=a" (a), "=d" (d) : "c" (c));

   return ((unsigned long)a) | (((unsigned long)d) << 32);;
}

// rdpmc_actual_cycles uses a "fixed-function" performance counter to return the count of actual CPU core cycles
//       executed by the current core.  Core cycles are not accumulated while the processor is in the "HALT" state,
//       which is used when the operating system has no task(s) to run on a processor core.
unsigned long rdpmc_actual_cycles()
{
   unsigned a, d, c;

   c = (1<<30)+1;
   __asm__ volatile("rdpmc" : "=a" (a), "=d" (d) : "c" (c));

   return ((unsigned long)a) | (((unsigned long)d) << 32);;
}

// rdpmc_reference_cycles uses a "fixed-function" performance counter to return the count of "reference" (or "nominal")
//       CPU core cycles executed by the current core.  This counts at the same rate as the TSC, but does not count
//       when the core is in the "HALT" state.  If a timed section of code shows a larger change in TSC than in
//       rdpmc_reference_cycles, the processor probably spent some time in a HALT state.
unsigned long rdpmc_reference_cycles()
{
   unsigned a, d, c;

   c = (1<<30)+2;
   __asm__ volatile("rdpmc" : "=a" (a), "=d" (d) : "c" (c));

   return ((unsigned long)a) | (((unsigned long)d) << 32);;
}

unsigned long rdpmc(int index)
{
   unsigned a, d, c;

   c = index ;
   __asm__ volatile("rdpmc" : "=a" (a), "=d" (d) : "c" (c));

   return ((unsigned long)a) | (((unsigned long)d) << 32);;
}
int main()
{
  auto start = rdpmc_instructions();
  SetAffinity(1);
  printf("%ld\n", rdpmc(0));
  printf("%ld\n", rdpmc(1));
  printf("%ld\n", rdpmc(2));
  printf("%ld\n", rdpmc(3));
  printf("%ld\n", rdpmc(4));
  printf("%ld instructions retired, %ld cycles, %ld reference cycles\n", rdpmc_instructions(), rdpmc_actual_cycles(), rdpmc_reference_cycles());
}
