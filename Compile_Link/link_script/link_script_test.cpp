//http://docs.adacore.com/live/wave/binutils-stable/html/ld/ld.html

/*
1. text must align with HUGEPAGE_SIZE
2. remap must completed before main. It can't located in text segment
*/
#include <errno.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/mman.h>
#include <unistd.h>
#include <string.h>
#include <iostream>
#include <array>
#include <sstream>
#include <fstream>

extern char __executable_start;
extern char __etext;
extern char __preinit_array_start;
// PROVIDE(__text_start_debug = .);
extern char __text_start_debug, __text_end_debug;
char* text_start_addr = &__text_start_debug;
const char* text_end_addr = &__text_end_debug;

extern char __start_remap_text_section, __stop_remap_text_section;
char* remap_start_addr = &__stop_remap_text_section;
char* remap_end_addr = &__stop_remap_text_section;
/*
THP can't support non-anymous mapping, we can't get THP by "mmap exetuable files, then start it"
1.copy text into temp addr
2.munmap text range
3.remap the text segment by MAP_FIXED
4.restore the text contens.
*/
int __attribute__((section("remap_text_section"))) RemapTextSegment() //try our best to minimize the dynamic lib dependency
{
    printf("Text starts from %p, ends at %p\n", text_start_addr, text_end_addr);
    printf("remap [%p, %p]\n", remap_start_addr, remap_end_addr);
    const auto InstSize = text_end_addr - text_start_addr;
    char* const pInst = reinterpret_cast<char*>(malloc(InstSize));
    auto index = 0;
    while(index < InstSize)
    {
        pInst[index] = text_start_addr[index];
        index++;
    }

    if (munmap(text_start_addr, InstSize)<0)
    {
        printf("Failed to munmap:%s\n", strerror(errno));
        return -1;
    }
    if (mmap(text_start_addr, InstSize, PROT_READ|PROT_WRITE, MAP_FIXED|MAP_PRIVATE|MAP_ANONYMOUS, 0, 0) == MAP_FAILED)
    {
        printf("Failed to mmap:%s\n", strerror(errno));
        return -1;
    }

    if(madvise(text_start_addr, InstSize, MADV_HUGEPAGE) <0)
    {
        printf("Failed to madvise:%s\n", strerror(errno));
        return -1;
    }
    for(index = 0; index <InstSize; index++)
        text_start_addr[index] = pInst[index];

    if (mprotect(text_start_addr, InstSize, PROT_READ|PROT_EXEC) < 0)
    {
        printf("Failed to mprotect:%s\n", strerror(errno));
        return -1;
    }
    free(pInst);
}

void memcpy_1(char* dest, char* src, size_t size)
{
  for(int i=0; i<size; i++)
    dest[i] = src[i];
}
bool __attribute__((section("remap_text_section")))  DisableBinaryShare()
{
  std::string BinaryName("a.out");
  std::string CurrentSmapsFile = "/proc/self/smaps";
  std::ifstream smapsStream(CurrentSmapsFile);
  if(!smapsStream.is_open())
  {
    printf("Failed to open %s\n", CurrentSmapsFile.c_str());
    return false;
  }
  void* tmp_addr;
  if ( (tmp_addr=mmap(NULL, 4096, PROT_READ|PROT_WRITE|PROT_EXEC, MAP_ANONYMOUS|MAP_PRIVATE, -1, 0)) == MAP_FAILED)
  {
      printf("Failed to mmap:%s\n", strerror(errno));
      return false;
  }
  if (munmap(tmp_addr, 4096) < 0)
  {
    printf("Failed to munmap\n");
    return false;
  }
  typedef decltype(mmap) *mmap_type ;
  typedef decltype(munmap) *munmap_type ;
  typedef decltype(printf) *printf_type;
  mmap_type mmap_addr =  reinterpret_cast<mmap_type>(reinterpret_cast<long*>(mmap));
  printf("mmap=%p, mmap_addr=%p\n", mmap, mmap_addr);
  munmap_type  munmap_addr = reinterpret_cast<munmap_type>(reinterpret_cast<long*>(munmap));
  printf("munmap=%p, munmap_addr=%p\n", munmap, munmap_addr);
  printf_type printf_addr = reinterpret_cast<printf_type>(reinterpret_cast<long*>(printf));

  std::array<char, 32>  rangeL;
  std::array<char, 32>  rangeR;
  std::array<char, 8>   perms;
  std::array<char, 512> other;
  std::array<char, 2048> line;
  char * tmp = (char*)malloc(1024*1024*128);
  while (smapsStream.getline(&line[0], sizeof(line)) )
  {
    std::istringstream vmBuf(&line[0]);
    vmBuf.getline(&rangeL[0], sizeof(rangeL), '-');
    vmBuf.getline(&rangeR[0], sizeof(rangeR), ' ');
    vmBuf.getline(&perms[0], sizeof(perms), ' ');
    vmBuf.getline(&other[0], sizeof(other));
    auto rangeLPtr = reinterpret_cast<char*>(std::stoull(&rangeL[0], 0, 16));
    auto rangeRPtr = reinterpret_cast<char*>(std::stoull(&rangeR[0], 0, 16));

    if((std::string(&other[0]).find(BinaryName) != std::string::npos) && (text_start_addr>=rangeRPtr || text_end_addr<=rangeLPtr) && (remap_start_addr>=rangeRPtr || remap_end_addr<=rangeLPtr))
    {
        memcpy_1(tmp, rangeLPtr, rangeRPtr-rangeLPtr);
        printf_addr("unmapping %p\n", rangeLPtr);
        if (munmap_addr(rangeLPtr, rangeRPtr-rangeLPtr) < 0)
        {
          printf_addr("Failed to munmap\n");
          return false;
        }
        if (mmap_addr(rangeLPtr, rangeRPtr-rangeLPtr, PROT_READ|PROT_WRITE|PROT_EXEC, MAP_ANONYMOUS|MAP_PRIVATE|MAP_FIXED, -1, rangeRPtr-rangeLPtr) == MAP_FAILED)
        {
          printf_addr("Failed to mmap: %p %p %s\n", rangeLPtr, rangeRPtr, strerror(errno));
          exit(1);
        }
        memcpy_1(rangeLPtr, tmp, rangeRPtr-rangeLPtr);
        printf_addr("Success to remmap: %p %p %s\n", rangeLPtr, rangeRPtr, strerror(errno));

    }

    std::array<char, 128> FieldName;
    std::array<char, 128> Value;
    while(smapsStream.getline(&line[0], sizeof(line)))
    {
      long long AnonHugePagesSize = 0;
      std::istringstream inbuf(&line[0]);
      const std::string targetField("AnonHugePages");
      const std::string endField("VmFlags");
      inbuf.getline(&FieldName[0], sizeof(FieldName), ':');
      if(endField == &FieldName[0])
        break;
    }
  }
  return true;
}

static int remap_ret = RemapTextSegment();
bool isSharedDisable = DisableBinaryShare();
int main(void)
{
  printf("executable_start=%p\n", &__executable_start);
  printf("text_start=%p\n", &__text_start_debug);
  printf("text_end=%p\n", &__text_end_debug);
  printf("etext=%p\n", &__etext);
  printf("__preinit_array_start=%p\n", &__preinit_array_start);
  printf("remap=%d\n", remap_ret);
  printf("sharedDisable=%d\n", isSharedDisable);
  while(1) usleep(1000*1000);
  return 0;
}
