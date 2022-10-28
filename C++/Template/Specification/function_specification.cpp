#include <stdio.h>
//模板参数个数不同的时候，是函数模板的重载
template <typename T1, typename T2>
auto Foo(T1 t1, T2 t2)
{
    printf("Foo(T1 t1, T2 t2)\n");
}

template <typename T1, typename T2>
auto Foo(T2 t1, T1 t2)
{
    printf("Foo(T2 t1, T1 t2)\n");
}

template <typename T>
auto Foo(T t1, T t2)
{
    printf("Foo(T t1, T t2)\n");
}

template <>
auto Foo<long, float>(long t1, float t2)
{
    printf("Foo<long, float>(long t1, float t2)\n");
}


//重载上述函数模板
template<typename ... Args>
auto Foo(Args... args)
{
    printf("Foo()(Args... args)\n");
}
//特化变长函数模板
template <>
auto Foo(int, long, float)
{
    printf("Foo(int, long, float)\n");
}
int main()
{
    int I=1;
    long L=2;
    float F=3;

    Foo<int, long>(I, L);
    Foo<long, int>(I, F);//Foo(T2 t1, T1 t2)
    Foo<long>(I, L);  //Foo(T2 t1, T1 t2)  Foo(long, int)
    Foo(I, I); //Foo(T t1, T t2)
    Foo(I, I, I); //Foo()(Args... args)
    Foo(I, L, F); //Foo(int, long, float)

//  Foo<long, float>(long t1, float t2) 是 Foo(T1 t1, T2 t2)的特化版本
//  overload resolution 的时候，有可能选择 Foo(T1 t1, T2 t2)， 也有可能选择 Foo(T2 t1, T1 t2)
//  选择 Foo(T1 t1, T2 t2)时，因为有特化版本 Foo<long, float>(long t1, float t2), 所以编译器报下列冲突

/*
    Foo(L,F);
        function_specification.cpp:37:12: error: call of overloaded ‘Foo(long int&, float&)’ is ambiguous
           37 |     Foo(L,F);
              |            ^
        function_specification.cpp:21:6: note: candidate: ‘auto Foo(T1, T2) [with T1 = long int; T2 = float]’
           21 | auto Foo<long, float>(long t1, float t2)
              |      ^~~~~~~~~~~~~~~~
        function_specification.cpp:9:6: note: candidate: ‘auto Foo(T2, T1) [with T1 = float; T2 = long int]’
            9 | auto Foo(T2 t1, T1 t2)

*/

}
