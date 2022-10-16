#include <unistd.h>
#include <sys/syscall.h>  

inline pid_t gettid()
{
    return syscall(SYS_gettid);
}
