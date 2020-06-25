#include <unistd.h> 
#include <sys/syscall.h>
inline long gettid() 
{ 
    syscall(__NR_gettid);
}
