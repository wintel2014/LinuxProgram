#include <iostream>
#include <type_traits>

template <typename... Args>
struct IndexOfTypes;

//IndexOfTypes<int, long, int, double, float>:value == 1; int's index in [long, int, double, float]
template <typename Target, typename Head, typename... Args>
struct IndexOfTypes<Target, Head, Args...>
{
    constexpr static int value = IndexOfTypes<Target, Args...>::value + 1;
};

template <typename Target, typename... Args>
struct IndexOfTypes<Target, Target, Args...>
{
    constexpr static int value = 0;
};

int main()
{
    std::cout<<IndexOfTypes<double, long, int, double, float>::value <<"\n";
}
