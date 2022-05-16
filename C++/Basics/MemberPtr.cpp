#include <iostream>
#include <stdio.h>
#include <boost/core/demangle.hpp>
struct Foo
{
    int D1;
    int D2;
    int D3;
    double D4;

    Foo(int d1, int d2, int d3){D1=d1; D2=d2; D3=d3;}
    virtual void Test() {}
    void Display() {printf("%d %d %d\n", D1, D2, D3);}
};

//template<int Foo::* >
template<auto value> //since C++17
void member()
{
    printf("Unknown member\n");
}

template<>
void member<&Foo::D1>()
{
    printf("D1\n");
}
template<>
void member<&Foo::D2>()
{
    printf("D2\n");
}
template<>
void member<&Foo::D4>()
{
    printf("D4\n");
}

template<typename>
struct Trait;

template<typename CLASS, typename T>
struct Trait<T CLASS::*>
{
    using class_type = CLASS;
    using value_type=T;
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
    printf("obj.*pD2=%d\n",obj.*pD2);

    decltype(Foo::D1) type1; //int, same to obj.D1
    decltype(&Foo::D1) type2; // int Foo::*
    auto value = &Foo::D1; //it's a "value" rather than "type"
    printf("[%s] [%s] %p->%d(adjacent to vptr) \n", boost::core::demangle(typeid(type1).name()).c_str(), boost::core::demangle(typeid(type2).name()).c_str(), value, obj.*value);
    
    static_assert(std::is_same_v<decltype(&Foo::D1), decltype(&Foo::D2)>);
    member<&Foo::D1>();
    member<&Foo::D2>();
    member<&Foo::D3>();
    member<&Foo::D4>();

    printf("%s\n", boost::core::demangle(typeid(Trait<decltype(&Foo::D1)>::class_type).name()).c_str() );
}
