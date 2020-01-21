#include <stdio.h>
#include <stdlib.h>
/*
--wrap=symbol
    Use a wrapper function for symbol.  Any undefined reference to symbol will be resolved to "__wrap_symbol".  Any undefined reference to "__real_symbol" will be resolved to symbol.

    This can be used to provide a wrapper for a system function.  The wrapper function should be called "__wrap_symbol".  If it wishes to call the system function, it should call "__real_symbol".

    Here is a trivial example:

            void *
            __wrap_malloc (size_t c)
            {
              printf ("malloc called with %zu\n", c);
              return __real_malloc (c);
            }
*/
#include <execinfo.h>
#define BT_BUF_SIZE 32

void bt (void)
{
    int j, nptrs;
    void *buffer[BT_BUF_SIZE];
    char **strings;

    nptrs = backtrace(buffer, BT_BUF_SIZE);
    backtrace_symbols_fd(buffer, nptrs, 1);
}
extern "C" {
void* __real_malloc(size_t);
void *__wrap_malloc (size_t c)
{
  printf ("malloc called with %zu\n", c);
  return __real_malloc (c);
}
}
