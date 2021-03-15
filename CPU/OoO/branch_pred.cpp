#include <stdlib.h>
#include "../../Utils/readTsc.hpp"
#include "../../Utils/affinity.hpp"
template<int count1, int count2, int count3>
void __attribute__((noinline)) loop()
{
    //volatile long ret = 0;
    auto start = readTsc();
    for (int i = 0; i < count1; i++) {
      for (int j = 0; j < count2; j++) {
        for (int k = 0; k < count3; k++) {
            //ret++;
        }
      }
    }
    auto duration = readTsc() - start;
    printf("count1=%d, count2=%d, count3=%d %ld(avg=%lf)\n",count1, count2, count3, duration, duration/((double)count1*count2*count3));
}

int main(int argc, char* argv[]) 
{
    
    float src [256];
    for(int i=0; i<sizeof(src)/sizeof(src[0]); i++)
    {
      src[i] = argc;
    }

    SetAffinity(1);
    auto start = readTscp();
    auto duration = readTscp() - start;
    printf("duration = %ld\n", duration);

    float result = 0;
    start = readTscp();
    for(int i=0; i<sizeof(src)/sizeof(src[0]); i++)
    {
      result += src[i];
    }
    duration = readTscp() - start;
    printf("%f, duration = %ld\n",result, duration);

    result =0;
    start = readTscp();
    for(int i=0; i<sizeof(src)/sizeof(src[0]); i+=4)
    {
      result += src[i];
      result += src[i+1];
      result += src[i+2];
      result += src[i+3];
    }
    duration = readTscp() - start;
    printf("%f, duration = %ld\n",result, duration);
}
