#include <cstddef>
#include <iostream>

template <typename Type, typename MT, MT Type::*memptr>
constexpr size_t OffsetFun(Type&& obj)
{
    return (char*)&(obj.*memptr) - (char*)&obj;
}
struct S
{
    virtual ~S() { std::cout<<this<<"\n";} //warning: offsetof within non-standard-layout type ‘S’ is conditionally-supported [-Winvalid-offsetof]

    char   m0;
    double m1;
    short  m2;
    char   m3;
 private: 
    int z; // warning: 'S' is a non-standard-layout type
};
 
int main()
{
    std::cout << "offset of char   m0 = " << OffsetFun<S, decltype(S::m0), &S::m0>(S{}) << '\n';
    std::cout << "offset of char   m0 = " << offsetof(S, m0) << '\n';
}
