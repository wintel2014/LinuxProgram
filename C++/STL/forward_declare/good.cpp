#include "b.hpp"
#include <stdio.h>
void f(B*)
{
    printf("%s\n", __PRETTY_FUNCTION__);
}
void f(void*)
{
    printf("%s\n", __PRETTY_FUNCTION__);
}

void test(D* d)
{
    f(d);
}

int main()
{
    D* d;
    test(d);
}
