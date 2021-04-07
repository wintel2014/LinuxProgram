#pragma once
#include <stdio.h>
#include "sysconf.h"
#include "gettid.hpp"
#include <sched.h>
#include <unistd.h> /* sysconf */

int SetAffinity(size_t CoreN)
{
    cpu_set_t mask;

    CPU_ZERO(&mask);
    CPU_SET(CoreN, &mask); /* add CPU0 to cpu set */
    if (sched_setaffinity(0, sizeof(cpu_set_t), &mask) == -1)  //CoreN starts from 0, if equals to nrcpus, "Invalid Argument" returned
    {
        printf("%ld CPUs in system\n", nrcpus);
        perror("sched_setaffinity");
        return -1;
    }
    return 0;
}

template<size_t CoreN>
int SetAffinity()
{
    cpu_set_t mask;

    CPU_ZERO(&mask);
    CPU_SET(CoreN, &mask); /* add CPU0 to cpu set */
    if (sched_setaffinity(0, sizeof(cpu_set_t), &mask) == -1)  //CoreN starts from 0, if equals to nrcpus, "Invalid Argument" returned
    {   
        printf("%ld CPUs in system\n", nrcpus);
        perror("sched_setaffinity");
        return -1;
    }
    return 0;
}

template<size_t CoreN>
int SetAffinity(cpu_set_t& mask)
{
    CPU_SET(CoreN, &mask); /* add CPU0 to cpu set */
    if (sched_setaffinity(0, sizeof(cpu_set_t), &mask) == -1) 
    {   
        printf("%ld CPUs in system\n", nrcpus);
        perror("sched_setaffinity");
        return -1;
    }
    return 0;
}

void sched_fifo()
{
    struct sched_param param;
    param.sched_priority = sched_get_priority_max(SCHED_FIFO); //same to watchdog/x
    if (sched_setscheduler(gettid(), SCHED_FIFO, &param)<0)
        perror("Faied to sched_setscheduler");
}
