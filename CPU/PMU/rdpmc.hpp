#pragma once
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
#include "../../Utils/affinity.hpp"

enum PMCID {
    INSTRUCTIONS_RETIRED = 1<<30, //not uops
    UNHALTED_CYCLES_MAY_SCALE = INSTRUCTIONS_RETIRED+1,
    REF_CYCLES = INSTRUCTIONS_RETIRED+2
};

unsigned long rdpmc(int index)
{
   unsigned a, d, c;

   c = index ;
   __asm__ volatile("rdpmc" : "=a" (a), "=d" (d) : "c" (c));

   return ((unsigned long)a) | (((unsigned long)d) << 32);;
}
// rdpmc_instructions uses a "fixed-function" performance counter to return the count of retired instructions on
//       the current core in the low-order 48 bits of an unsigned 64-bit integer.
unsigned long rdpmc_instructions()
{
    return rdpmc(PMCID::INSTRUCTIONS_RETIRED);
}

unsigned long rdpmc_actual_cycles()
{
    rdpmc(PMCID::UNHALTED_CYCLES_MAY_SCALE);
}

unsigned long rdpmc_reference_cycles()
{
    rdpmc(PMCID::REF_CYCLES);
}
