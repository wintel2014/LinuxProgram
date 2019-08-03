#include <iostream>

template<size_t Number, size_t Current>
struct IsPrimeNumberImpl
{
    static constexpr bool value = (Number%Current!=0) && IsPrimeNumberImpl<Number, Current-1>::value;
};

template<size_t Number>
struct IsPrimeNumberImpl<Number, 1>
{
    static constexpr bool value = 1;
};

template<size_t Number>
struct IsPrimeNumber
{
    enum {value = IsPrimeNumberImpl<Number, (Number>>1)+1>::value} ;
};

int main()
{
    std::cout<< IsPrimeNumber<3>::value<<"\n";
    std::cout<< IsPrimeNumber<19>::value<<"\n";
    std::cout<< IsPrimeNumber<10000>::value<<"\n";
}
