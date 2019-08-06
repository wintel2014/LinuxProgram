#include <stdio.h>
#include "../readTsc.hpp"
#include <string.h>

void recursive_call(int n)
{
    if(n==0)
        return;
    else
        recursive_call(n-1);
}
int main(int argc, char* argv[])
{
    recursive_call(18);
    recursive_call(18);
    recursive_call(18);
    recursive_call(18);
    {
        TSCCount t;
        recursive_call(32);
        printf("Init cost ");
    }
}
