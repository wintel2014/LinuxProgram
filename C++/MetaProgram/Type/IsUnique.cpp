#include <iostream>
#include <type_traits>

namespace check_first {
template <typename... Args>
struct is_unique_type
{
    constexpr static bool value = true;
};

template <typename A, typename B, typename... Args>
struct is_unique_type<A, B, Args...>
{
    constexpr static bool value = (is_unique_type<A,B>::value && is_unique_type<A, Args...>::value);
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

template <typename... Args>
struct is_unique_type
{
    constexpr static bool value = true;
};
//is_unqique_type<A...> guarantee that [A...] is unique
//If B can't be found in [A...] , then [B, A...] is unique
template <typename A, typename... Args>
struct is_unique_type<A,Args...>
{
    constexpr static bool value = check_first::is_unique_type<A, Args...>::value && is_unique_type<Args...>::value;
};

template <size_t... Args>
struct is_unique_integer
{
    constexpr static bool value = is_unique_type<std::integral_constant<size_t, Args>...>::value;
};

template <size_t v>
using integral = std::integral_constant<size_t, v>;
int main()
{
    static_assert(is_unique_type<int, double, long, long>::value==false, "");
    static_assert(is_unique_type<int, long, double, short>::value, "");
    static_assert(!is_unique_type<integral<1>, integral<2>, integral<3>, integral<4>, integral<5>, integral<5> ,integral<6>, integral<7>>::value, "Not uniqure");

    std::cout<<is_unique_integer<1, 3, 2, 2>::value<<"\n";
    std::cout<<is_unique_integer<1, 2, 3,4,5,6,7,8,9,0,6>::value<<"\n";
    std::cout<<is_unique_integer<1, 2, 3,4,5,6,7,8,9,0,10,11,12,13,14,15,16>::value<<"\n";
}
