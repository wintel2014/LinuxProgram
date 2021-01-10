#pragma once
#include <stdio.h>
/*
CPUID.0A.EDX[15]
input : EAX=0x0A
output: EDX[15]
*/

struct CPUIDInfo
{
  unsigned int EAX{0};
  unsigned int EBX{0};
  unsigned int ECX{0};
  unsigned int EDX{0};
};


static inline void CPUID(int leaf, int sub_leaf, CPUIDInfo& info)
{
  
  asm __volatile__(
      "cpuid"
      : "=a"(info.EAX), "=b"(info.EBX), "=c"(info.ECX), "=d"(info.EDX)
      : "a"(leaf), "c"(sub_leaf)
      :
  );
}


namespace CacheInfo{
  struct EAX {};

}

namespace PMC
{
  struct EAX
  {
    int VersionID : 8;
    int NumPMCPerCore : 8;
    int BitWidthPMC : 8;
    int LenOfEBX : 8;
  }__attribute__((packed));

  //1:Disabled
  struct EBX 
  {
    int CoreCycle : 1;
    int InstructionRetired : 1;
    int ReferenceCycles : 1;
    int LLC : 1;
    int LLCMissed : 1;
    int BranchRetired :1 ;
    int BranchMispredict : 1;
  }__attribute__((packed));

  struct EDX
  {
    int Num : 5;
    int BitWidthPMC : 8;
  }__attribute__((packed));
  
  CPUIDInfo Parse()
  {
    constexpr int APM_leaf = 0x0A; //Architectual Performance Monitoring
    CPUIDInfo info;
    CPUID(APM_leaf, 0, info);
    auto p_PMC_EAX = (EAX*)&info.EAX;
    auto p_PMC_EBX = (EBX*)&info.EBX;
    auto p_PMC_EDX = (EDX*)&info.EDX;
    printf("PMC: version=%d, %d general-purpose counters, %d bits of PMC, %d bits of EBX\n", p_PMC_EAX->VersionID, p_PMC_EAX->NumPMCPerCore, p_PMC_EAX->BitWidthPMC, p_PMC_EAX->LenOfEBX);
    printf("\t %d fixed-function counters, %d bits of PMC\n", p_PMC_EDX->Num, p_PMC_EDX->BitWidthPMC); //only p_PMC_EAX->VersionID >1
    return info;
  }
};

namespace Cache
{
  enum Leaf 
  {
    Cache_TLB = 0x02,
    Cache = 0x04
  };

  struct  EAX
  {
    int type:5;
    int level:3;
    int selfInitCacheLelvel:1;
    int FullyAssociate:1;
    int Rsv:4;
  }__attribute__((packed));
//cat /sys/devices/system/cpu/cpu0/cache/index3/ways_of_associativity
  void Parse()
  {
    const char* pType = nullptr;
    CPUIDInfo info;
    int sub_leaf = 0;
    CPUID(Leaf::Cache, sub_leaf++, info);
    while(info.EAX)
    {
      switch(((EAX*)&info.EAX)->type)
      {
        case 0x01: pType = "D"; break;
        case 0x02: pType = "I"; break;
        case 0x03: pType = "U"; break; //Uni
        default : break;
      }
      printf("Cache level[%d]: %sCache, %d ways, %d sets %X\n", ((EAX*)&info.EAX)->level, pType, (info.EBX>>22)+1, info.ECX+1, info.EDX);
      CPUID(Leaf::Cache, sub_leaf++, info);
    }
  }
}
