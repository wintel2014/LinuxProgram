#include <string>
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

int main()
{
    std::string s = "This is a test for wrap symbol\n";
    char *ptr = reinterpret_cast<char*>(malloc(100)); //call __wrap_malloc
}
