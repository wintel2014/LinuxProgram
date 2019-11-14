#include <iostream>

namespace check_first {
template <typename... Args>
struct is_unique_type;

template <typename A, typename B, typename... Args>
struct is_unique_type<A, B, Args...>
{
    constexpr static bool value = is_unique_type<A,B>::value && is_unique_type<A, Args...>::value;
};

template <typename A, typename B>
struct is_unique_type<A,B>
{
    constexpr static bool value = true;
};

template <typename A>
struct is_unique_type<A,A>
{
    constexpr static bool value = false;
};
}

template <typename A, typename B, typename... Args>
struct is_unique_type
{
    constexpr static bool value = check_first::is_unique_type<A, B, Args...>::value && check_first::is_unique_type<B, Args...>::value;
};

int main()
{
    std::cout<<is_unique_type<int, long, double, long, short>::value<<"\n";
    std::cout<<is_unique_type<int, long, double, short>::value<<"\n";
}
