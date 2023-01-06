#include "foo.hpp"
extern Foo gVar;
void foo()
{
    printf("%p\n", &gVar);
}
