#include "perf.h"
#include <stdio.h>
int main()
{
     performance::PerfEventInit();
    //char buf[4096];
    //performance::perfEventsInstance().readEvent(buf);
    auto start = performance::getInstructions();
    printf("Calibrate tsc=%ld instructions=%ld\n", rdtscp(), performance::getInstructions()-start); 
}
