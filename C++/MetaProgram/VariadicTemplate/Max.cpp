#include <iostream>

template<size_t N1, size_t N2, size_t ...Num>
struct Max
{
    static constexpr size_t value = N1>=N2 ? Max<N1, Num...>::value : Max<N2, Num...>::value;
};

template<size_t N1, size_t N2>
struct Max<N1, N2>
{
    static constexpr size_t value = N1>=N2 ? N1:N2;
};

int main()
{
    std::cout<<Max<1, 2>::value<<"\n";
    std::cout<<Max<2, 1>::value<<"\n";
}
