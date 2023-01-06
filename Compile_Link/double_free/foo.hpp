#pragma once
#include <stdio.h>
struct Foo
{
    char mData[128];
    Foo() {printf("%s\n",__FUNCTION__);}
};
void foo();
