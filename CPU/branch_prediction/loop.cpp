#include <stdlib.h>
#include "../../Utils/readTsc.hpp"
#include "../../Utils/affinity.hpp"
constexpr int Count1=1000000;
constexpr int Count2=10;
void __attribute__((noinline)) loop(int count1, int count2)
{
    //volatile long ret = 0;
    auto start = readTsc();
    for (int i = 0; i < count1; i++) {
        for (int k = 0; k < count2; k++) {
            //ret++;
        }
    }
    auto duration = readTsc() - start;
    printf("count1=%d, count2=%d, %ld\n",count1, count2, duration);
}

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
    printf("count1=%d, count2=%d, count3=%d %ld(avg=%ld)\n",count1, count2, count3, duration, duration/((long)count1*count2*count3));
}
void __attribute__((noinline)) loop1()
{
    //volatile long ret = 0;
    auto start = readTsc();
    for (int i = 0; i < 100; i++) {
        for (int j = 0; j < 1000; j++) {
            for (int k = 0; k < 10000; k++) {
                //ret++;
            }
        }
    }
    auto duration = readTsc() - start;
    printf("%ld\n",duration);
}
void __attribute__((noinline)) loop2()
{
    //volatile long ret = 0;
    auto start = readTsc();
    for (int i = 0; i < 10000; i++) {
        for (int j = 0; j < 1000; j++) {
            for (int k = 0; k < 100; k++) {
                //ret++;
            }
        }
    }
    auto duration = readTsc() - start;
    printf("%ld\n",duration);
}

int main(int argc, char* argv[]) 
{
    SetAffinity(1);
    if(argc == 3)
    {
        int count1 = atoi(argv[1]);
        int count2 = atoi(argv[2]);
        loop(count1, count2);
        loop(count2, count1);
    }
    else
    {
        //for(int i=0; i<10; i++)
        {
            printf("==================\n");
            loop1();
            loop2();

            loop<10, 1000, 10000>();
            loop<10000, 1000, 10>();
            loop<100, 1000, 10000>();
            loop<10000, 1000, 100>();
        }
    }
}
