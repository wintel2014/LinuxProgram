#include "bar.hpp"
extern Foo gVar;

void bar()
{
    printf("%p\n", &gVar);
}
