#include "../../Utils/affinity.hpp"
#include <string.h>
#include <vector>
#include <thread>
#include <stdio.h>
#include <sys/mman.h>
#include <cstdint>
#include <chrono>
#include <thread>
#include <atomic>


#define INSTRUMENT_ASM_IMPL(NAME, FILE, LINE, FUNC) \
  __asm__ __volatile__ (   \
    ".align 8 \n" \
    "1:\n"                                     \
    ".byte 0x0F, 0x1F, 0x44, 0x00, 0x00 \n"  \
    ".pushsection InstrumentInstructionSection, \"wa?\", @progbits \n" \
    ".align 32 \n"                          \
    ".quad 1b \n"                            \
    ".quad %P[Name] \n"                      \
    ".quad %P[File] \n"                      \
    ".quad %P[Func] \n"                      \
    ".quad %P[Line] \n"                      \
    ".popsection    \n"                      \
  :                                          \
  : [Name] "i"(NAME),                        \
    [File] "i"(FILE),                        \
    [Func] "i"(FUNC),                        \
    [Line] "i"(LINE)                        \
  : "flags")


#define INSTRUMENT_ASM(NAME)  INSTRUMENT_ASM_IMPL(#NAME, __FILE__, __LINE__, __PRETTY_FUNCTION__)


struct InstrumentBlock
{
  char* mInstAddr;
  const char* mName;
  const char* mFile;
  const char* mFunc;
  size_t mLine;
};

void Foo()
{
  //printf("This function is used for test\n");
  for(int i=0; i<5; i++);
}

extern InstrumentBlock __start_InstrumentInstructionSection;
InstrumentBlock* pInstrumentBlock = &__start_InstrumentInstructionSection;

using namespace std::chrono_literals;

std::atomic_flag CrossModifyLock = ATOMIC_FLAG_INIT;
#define MODIFY_BY_MEMCPY 0
int main()
{

  printf("Addr: %p\nName: %s\nFile: %s\nFunc:%s\nLine: %ld\n",
                pInstrumentBlock->mInstAddr,
                pInstrumentBlock->mName,
                pInstrumentBlock->mFile,
                pInstrumentBlock->mFunc,
                pInstrumentBlock->mLine
         );
  mprotect((void*)((uintptr_t)__start_InstrumentInstructionSection.mInstAddr&(~0xFFF)), 4096, PROT_READ|PROT_WRITE|PROT_EXEC);

  unsigned char CALL[5]={0xE8};
  int offset = (char*)(Foo) - (__start_InstrumentInstructionSection.mInstAddr+5);
  *(int *)(CALL+1) = offset;
  unsigned char NOOP[5]={0x0F, 0x1F, 0x44, 0x00, 0x00};
  
  CALL[5] = __start_InstrumentInstructionSection.mInstAddr[5];
  CALL[6] = __start_InstrumentInstructionSection.mInstAddr[6];
  CALL[7] = __start_InstrumentInstructionSection.mInstAddr[7];
  *reinterpret_cast<volatile uint64_t*>(NOOP) = *reinterpret_cast<uint64_t*>(__start_InstrumentInstructionSection.mInstAddr);
  auto t = std::thread([offset, NOOP, CALL](){
                            SetAffinity(0);
                            while(1)
                            {
                              #if MODIFY_BY_MEMCPY
                              //while (CrossModifyLock.test_and_set(std::memory_order_acquire)) ;
                              memcpy(__start_InstrumentInstructionSection.mInstAddr, CALL, 5);
                              memcpy(__start_InstrumentInstructionSection.mInstAddr, NOOP, 5);
                              //CrossModifyLock.clear();
                              #else
                              *reinterpret_cast<volatile uint64_t*>(__start_InstrumentInstructionSection.mInstAddr) = *reinterpret_cast<const uint64_t*>(CALL);
                              *reinterpret_cast<volatile uint64_t*>(__start_InstrumentInstructionSection.mInstAddr) = *reinterpret_cast<const uint64_t*>(NOOP);
                              #endif
                            }}
           );

  SetAffinity(1);
  while(1)
  {
    #if MODIFY_BY_MEMCPY
    while (CrossModifyLock.test_and_set(std::memory_order_acquire)) ;
    #endif

    #if MODIFY_IN_SYNC_MODE
    memcpy(__start_InstrumentInstructionSection.mInstAddr, CALL, 5);
    #endif

    INSTRUMENT_ASM(Probe1);

    #if MODIFY_IN_SYNC_MODE
    memcpy(__start_InstrumentInstructionSection.mInstAddr, NOOP, 5);
    #endif

    #if MODIFY_BY_MEMCPY
    CrossModifyLock.clear();
    #endif
  }
  t.join();
}
