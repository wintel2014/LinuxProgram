#include <stdio.h>
#include "../readTsc.hpp"
#include "../affinity.hpp"
#include <string.h>

int main(int argc, char* argv[])
{
    SetAffinity<0>();   
    auto start = readTsc();
    sleep(1);
    auto end = readTsc();
    printf("%ld\n", (end-start)/1000/1000);

}
