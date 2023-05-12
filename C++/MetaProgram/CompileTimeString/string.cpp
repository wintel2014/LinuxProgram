#include <type_traits>
#include <stdio.h>
#include <utility>
template<char... C>
struct string{
    constexpr  char operator [](int index) // no necessary to return reference because of literal string
    {
        return get_N_ele<C...>(index); 
    }

    template<char Head, char... Left>
    static constexpr char get_N_ele(int index)
    {
        if (index==0)
            return Head;
        if constexpr(sizeof...(Left) == 0)
            return Head;
        else
            return get_N_ele<Left...>(index-1);
    }

    static constexpr char value[]= {C...,'\0'};
};

template<char... C_L, char... C_R>
string<C_L..., C_R...> merge(string<C_L...>, string<C_R...>)
{
    return string<C_L..., C_R...> {};
}


template<typename CharT, CharT... C>
constexpr string<C...> operator "" _s()
{
    return {};
}


template <char...C_L, char...C_R>
constexpr auto operator==(string<C_L...>, string<C_R...>)
{
    return std::is_same<string<C_L...>, string<C_R...>> {};
}

template <char...C_L, char...C_R>
constexpr auto operator+ (string<C_L...>, string<C_R...>)
{
    return string<C_L..., C_R...> {};
}

template <char C1, char...C>
void print(string<C1, C...>)
{
    printf("%c", C1);
    if constexpr (sizeof...(C) > 0)
        print(string<C...>{});
    else
        printf("\n");
}

template <size_t N, std::size_t ...Index>
auto constexpr make_string_impl(const char (&a)[N], std::index_sequence<Index...>)
{
    //return (string<a[Index]>{} + ...);
    //return string<a[0]>{} +  string<a[1]>{} ; error: ‘a’ is not a constant expression
}

template <size_t N, typename Indices=std::make_index_sequence<N>>
auto constexpr make_string(const char (&a)[N])
{
    //return make_string_impl(a, Indices{});
    //return string<a[0]>{} +  string<a[1]>{} ;
}

int main()
{
    auto s1 = "test"_s;
    auto s2 = "test"_s;
    auto s3 = "main"_s;

    printf("s1==s2 ==>%d\n", (s1==s2).value);
    printf("s1==s3 ==>%d\n", (s1==s3).value);
    printf("operator[] : %c %c %c\n", s1[1], s1[2], s1[3]);

    print(s1);
    print(s1+s2+s3);

    printf("%s\n", merge(s1, s3).value);
}
