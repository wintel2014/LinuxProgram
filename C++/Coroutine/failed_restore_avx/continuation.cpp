#include <immintrin.h>
#include <iostream>
#include <boost/context/all.hpp>

namespace ctx = boost::context;

alignas(256) float align_mem[8] = {
  1.1, 1.2, 1.3, 1.4,
  1.5, 1.6, 1.7, 1.8
};
int main()
{
  float* float_mem = align_mem;
  ctx::continuation source = ctx::callcc(
      [](ctx::continuation&& cc)
      {
        int count = 0;
        while(true)
        {
          cc = cc.resume();
          //populate the YMM0, the AVX register is not saved during context switch
          __asm__ __volatile__("vpxor %ymm0, %ymm0, %ymm0");
          std::cout<< count++ <<"\n";
        }
        return std::move(cc);
      }
  );

  for(int i=0; i<10; i++)
  {
    __m256 vec;
    __asm__ __volatile__(
      "mov %0, %%rax \n"
      "vmovaps (%%rax), %%ymm0\n"
      : : "m"(float_mem) : "%rax"
    );

    source = source.resume();

    __asm__ __volatile(
      "vmovaps %%ymm0, %0 \n"
      : "=m"(vec) : : "%rax"
    );

    for(int j=0; j<7; j++)
      std::cout<<((float*)&vec)[j]<<" ";
    std::cout<<"\n";
  }
}
