#include <unistd.h>

static long ticksPerSecond = sysconf(_SC_CLK_TCK);
static long PAGESIZE = sysconf(_SC_PAGESIZE);
#define nrcpus (sysconf(_SC_NPROCESSORS_CONF))
