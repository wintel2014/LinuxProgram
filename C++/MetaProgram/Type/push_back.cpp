#include <stddef.h>
#include <type_traits>

template <size_t Nth, typename... Ts>
struct NthType;

template <size_t Nth, typename Head, typename... Ts>
struct NthType<Nth, Head, Ts...> : NthType<Nth-1, Ts...>
{};

template <typename Head, typename... Ts>
struct NthType <0, Head, Ts...>
{
    using type = Head;
};

template <typename... Ts>
struct Vector
{
    constexpr static auto size = sizeof...(Ts);

    template <size_t Nth>
    constexpr static typename NthType<Nth, Ts...>::type Type();
};


template<typename T, typename... Ts>
Vector<T, Ts...> push_front(T, Vector<Ts...>) ;

template<typename T, typename... Ts>
Vector<Ts..., T> push_back(T, Vector<Ts...>) ;


template<typename T, template <typename... Ts> class V>
using push_back_t = decltype (push_front(T{}, V{}));

int main()
{
    Vector<char, short, int, float> tmp;

    decltype (push_front(1.1, tmp)) ret;
    static_assert(decltype(ret)::size == 5); 
    static_assert(std::is_same_v<decltype(ret.Type<0>()), double>);

    decltype (push_back(1.1, tmp)) ret2;
    static_assert(decltype(ret2)::size == 5); 
    static_assert(std::is_same_v<decltype(ret2.Type<4>()), double>);

    push_back_t<double, decltype(tmp)> ret3;
}


