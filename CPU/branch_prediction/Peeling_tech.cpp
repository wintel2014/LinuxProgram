#include "../../Utils/readTsc.hpp"
#include "../../Utils/affinity.hpp"
#include <stdlib.h>
#include <vector>
int gCount = 0;
void __attribute__((noinline)) handle_0()
{
    asm("nop");
}
void __attribute__((noinline)) handle_1()
{
    asm("nop");
}
void __attribute__((noinline)) handle_3()
{
    asm("nop");
}
void __attribute__((noinline)) handle_5()
{
    asm("nop");
}
void __attribute__((noinline)) handle_7()
{
    asm("nop");
}
void __attribute__((noinline)) handle_other()
{
    asm("nop");
}
#define LOOP (1000*1000)
void fun1()
{
    long unsigned duration = 0;
    unsigned loop = 0;
    while(loop++ < LOOP)
    {
        int n = random(); // random integer 0 to RAND_MAX
        if ( ! (n & 0x01) ) { // n will be 0 half the times
            n = 0; // updates branch history to predict taken
        }
        n = n&0x7;
        // indirect branches with multiple taken targets
        // may have lower prediction rates
        auto start = readTsc();
        switch (n) {
            case 0: handle_0(); break; // common target, correlated with branch history that is forward taken
            case 1: handle_1(); break; // uncommon
            case 3: handle_3(); break; // uncommon
            case 5: handle_5(); break; // uncommon
            case 7: handle_7(); break; // uncommon
            default: handle_other(); // common target
        }
        duration += readTsc()-start;
    }

    printf("%s : %ld\n",__PRETTY_FUNCTION__, duration/LOOP);
}
void fun2()
{
    int n = random(); // Random integer 0 to RAND_MAX
    if( ! (n & 0x01) )
        n = 0; // n will be 0 half the times
    n = n&0x7;
    long unsigned duration = 0;
    unsigned loop = 0;
    while(loop++ < LOOP)
    {
        auto start = readTsc();
        if (!n)
            handle_0(); // Peel out the most common target with correlated branch history
        else
        {
            switch (n) {
                case 1: handle_1(); break; // Uncommon
                case 3: handle_3(); break; // Uncommon
                case 5: handle_5(); break; // uncommon
                case 7: handle_7(); break; // uncommon
                default: handle_other(); // Make the favored target in the fall-through path
            }
        }
        duration += readTsc()-start;
    }

    printf("%s : %ld\n",__PRETTY_FUNCTION__, duration/LOOP);
}

int main()
{
    SetAffinity(1);
    fun1();
    fun2();
}
