#include <tuple>
#include <iostream>
#include <array>
#include <utility>
 
// debugging aid
template<typename T, T... ints>
void print_sequence(std::integer_sequence<T, ints...> int_seq)
{
    std::cout << "The sequence of size " << int_seq.size() << ": ";
    ((std::cout << ints << ' '),...);
    std::cout << '\n';
}
 
// Convert array into a tuple
template<typename Array, std::size_t... I>
auto a2t_impl(const Array& a, std::index_sequence<I...>)
{
    return std::make_tuple(a[I]...);
}
 
template<typename T, std::size_t N, typename Indices = std::make_index_sequence<N>>
auto a2t(const std::array<T, N>& a)
{
    return a2t_impl(a, Indices{});
}
 
// pretty-print a tuple
 
template<class Ch, class Tr, class Tuple, std::size_t... Is>
void print_tuple_impl(std::basic_ostream<Ch,Tr>& os,
                      const Tuple& t,
                      std::index_sequence<Is...>)
{
    ((os << (Is == 0? "" : ", ") << std::get<Is>(t)), ...);
}
 
template<class Ch, class Tr, class... Args>
auto& operator<<(std::basic_ostream<Ch, Tr>& os,
                 const std::tuple<Args...>& t)
{
    os << "(";
    print_tuple_impl(os, t, std::index_sequence_for<Args...>{});
    return os << ")";
}
template<std::size_t... Is>
constexpr std::index_sequence<sizeof...(Is)-1-Is...> RevertSequenceImpl(const std::index_sequence<Is...>&);

template<std::size_t... Is>
constexpr std::index_sequence<(2*Is+1)...> OddSequenceImpl(const std::index_sequence<Is...>&);

template<std::size_t N>
using RevertSequence = decltype(RevertSequenceImpl(std::make_index_sequence<N>{}));

template<std::size_t N>
using OddSequence = decltype(OddSequenceImpl(std::make_index_sequence<N>{}));
 
template<std::size_t... I1, std::size_t... I2>
constexpr std::index_sequence<I1..., I2...> operator +(const std::index_sequence<I1...>,const std::index_sequence<I2...>)
{
    return std::index_sequence<I1..., I2...> {};
}


template<size_t N, typename HEAD, typename ...Left>
HEAD&& get(HEAD&& h, Left&&... L)
{
    if constexpr(sizeof...(Left)==0 or N==0)
    {
        //static_assert(N==0);
        return std::forward<HEAD>(h);
    }
    else
    {
        return get<N-1>(std::forward<Left>(L)...);
    }
}

#include<iomanip>
template<size_t...Index, typename ...Args>
void HandleIndexArgs(std::index_sequence<Index...>&seq, Args&&... args)
{
    std::cout<<std::setiosflags(std::ios::fixed);  //保证setprecision()是设置小数点后的位数。
    ((std::cout<<Index<<":"<< std::setprecision(1) << get<Index>(std::forward<Args>(args)...) << " "),...);
}


template<typename ...Args>
void Func(Args&&... args)
{
    auto sequence = OddSequence<(sizeof...(args))/2>{};
    HandleIndexArgs(sequence, std::forward<Args>(args)...); 
    std::cout<<'\n';
}

int main()
{
    Func(0.0, 1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0);
    Func(0.0, 1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0);
    Func(0.0, 1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0);
    Func(0.0, 1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0, 10.0);

    auto sum = std::make_index_sequence<5>() + std::make_index_sequence<8>();
    print_sequence(sum);
    print_sequence(RevertSequence<20>{});
    print_sequence(OddSequence<20>{});
     
    print_sequence(std::integer_sequence<unsigned, 9, 2, 5, 1, 9, 1, 6>{});
    print_sequence(std::make_integer_sequence<int, 20>{});
    print_sequence(std::make_index_sequence<10>{});
    print_sequence(std::index_sequence_for<float, std::iostream, char>{});
 
    std::array<int, 4> array = {1,2,3,4};
 
    // convert an array into a tuple
    auto tuple = a2t(array);
    static_assert(std::is_same<decltype(tuple),
                               std::tuple<int, int, int, int>>::value, "");
 
    // print it to cout
    std::cout << tuple << '\n';
 
}
