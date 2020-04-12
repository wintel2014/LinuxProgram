#include<stdio.h>
#include<sys/time.h>
#include<unistd.h>
#include "readTsc.hpp"
int main()
{
    int delay = 5;
    auto start = readTsc();
    usleep(delay*1000*1000);
    printf("%lf\n", (readTsc()-start)/1.0/delay/1000/1000);
    
}
