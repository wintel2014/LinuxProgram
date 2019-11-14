/* /proc/sys/kernel/sched_rt_runtime_us (950000us）
   /proc/sys/kernel/sched_rt_period_us (1000000us） => 95% cpu usage
*/
#include <stdlib.h>
#include <sched.h>
#include <stdio.h>
#include "../affinity.hpp"
int main(int argc, char* argv[])
{
    if (argc != 2)
        printf("Error: pls input CoreNumber\n");
    SetAffinity(atoi(argv[1]));
    struct sched_param param;
    param.sched_priority = sched_get_priority_max(SCHED_FIFO); //same to watchdog/x
    if (sched_setscheduler(getpid(), SCHED_FIFO, &param)<0)
        perror("sched_setscheduler ");
    
    while(1);
}
