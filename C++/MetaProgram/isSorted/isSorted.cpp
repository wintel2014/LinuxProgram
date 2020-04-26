#include <iostream>


template <size_t ...Args>
struct isSorted;

template <size_t Arg1, size_t Arg2, size_t ...Left>
struct isSorted<Arg1, Arg2, Left...>
{
    static constexpr bool value = (Arg1<=Arg2) ? isSorted<Arg2, Left...>::value : false;
};

template <size_t Arg1, size_t Arg2>
struct isSorted<Arg1, Arg2>
{
    static constexpr bool value = (Arg1<=Arg2);
};

template <size_t ...Args>
bool Fun()
{
    return isSorted<Args...>::value;
}
int main()
{

    std::cout<<isSorted<1,2,3,4,5,6,7,8,9>::value<<"\n";
    std::cout<<isSorted<1,2,2,4,5,6,7,8,9>::value<<"\n";
    std::cout<<Fun<1,2,3,4,6,5,7,8,9>()<<"\n";
}
