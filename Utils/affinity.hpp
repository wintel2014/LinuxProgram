#include <sched.h>
#include <unistd.h> /* sysconf */

int SetAffinity(size_t CoreN)
{
    cpu_set_t mask;
    auto nrcpus = sysconf(_SC_NPROCESSORS_CONF);
    printf("%ld CPUs in system\n", nrcpus);

    CPU_ZERO(&mask);
    CPU_SET(CoreN, &mask); /* add CPU0 to cpu set */
    if (sched_setaffinity(0, sizeof(cpu_set_t), &mask) == -1)  //CoreN starts from 0, if equals to nrcpus, "Invalid Argument" returned
    {
        perror("sched_setaffinity");
        return -1;
    }
    return 0;
}

template<size_t CoreN>
int SetAffinity()
{
    cpu_set_t mask;
    auto nrcpus = sysconf(_SC_NPROCESSORS_CONF);
    printf("%ld CPUs in system\n", nrcpus);

    CPU_ZERO(&mask);
    CPU_SET(CoreN, &mask); /* add CPU0 to cpu set */
    if (sched_setaffinity(0, sizeof(cpu_set_t), &mask) == -1)  //CoreN starts from 0, if equals to nrcpus, "Invalid Argument" returned
    {   
        perror("sched_setaffinity");
        return -1;
    }
    return 0;
}

template<size_t CoreN>
int SetAffinity(cpu_set_t& mask)
{
    auto nrcpus = sysconf(_SC_NPROCESSORS_CONF);
    printf("%ld CPUs in system\n", nrcpus);
    CPU_SET(CoreN, &mask); /* add CPU0 to cpu set */
    if (sched_setaffinity(0, sizeof(cpu_set_t), &mask) == -1) 
    {   
        perror("sched_setaffinity");
        return -1;
    }
    return 0;
}
