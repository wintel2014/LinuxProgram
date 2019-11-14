#include <iostream>
#include <stdio.h>
struct Foo
{
    int D1;
    int D2;
    int D3;

    Foo(int d1, int d2, int d3){D1=d1; D2=d2; D3=d3;}
    virtual void Test() {}
    void Display() {printf("%d %d %d\n", D1, D2, D3);}
};


int main()
{
    Foo obj= {1,2,3};
    printf("int Foo::* : %p\n", &Foo::D2);
    printf("int * : %p\n", &obj.D2);

    void (Foo::*pFunc)() = &Foo::Display;
    printf("void Foo::Display : %p\n", &Foo::Display);
    (obj.*pFunc)();

    int Foo::*pD2 = &Foo::D2;
    printf("%d\n",obj.*pD2);
}
