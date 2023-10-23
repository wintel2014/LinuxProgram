#include <iomanip>
#include <iostream>
#include <string>
#include <type_traits>
#include <variant>
#include <vector>

 
// helper constant for the visitor #3
template<class>
inline constexpr bool always_false_v = false;
 
// helper type for the visitor #4
template<class... Ts>
struct overloaded : Ts... { using Ts::operator()...; };
// explicit deduction guide (not needed as of C++20)
template<class... Ts>
overloaded(Ts...) -> overloaded<Ts...>;
 

struct VariantCallable {
    template <typename T>
    void operator()(const T& t)
    {
        std::cout<<t<<' ';
    }

    template <typename T1, typename T2>
    void operator()(const T1& t1 , const T2& t2)
    {
        std::cout<<t1 <<"---"<<t2<<' ';
    }
};
int main()
{
    using var_t = std::variant<int, long, double>;
    std::vector<var_t> vec = {10, 15l, 1.5};
 
    for (auto& v: vec)
    {
        // 1. void visitor, only called for side-effects (here, for I/O)
        std::visit([](auto&& arg){ std::cout << arg; }, v);
 
        // 2. value-returning visitor, demonstrates the idiom of returning another variant
        var_t w = std::visit([](auto&& arg) -> var_t { return arg + arg; }, v);
 
        // 3. type-matching visitor: a lambda that handles each type differently
        std::cout << ". After doubling, variant holds ";
        std::visit([](auto&& arg)
        {
            using T = std::decay_t<decltype(arg)>;
            if constexpr (std::is_same_v<T, int>)
                std::cout << "int with value " << arg << '\n';
            else if constexpr (std::is_same_v<T, long>)
                std::cout << "long with value " << arg << '\n';
            else if constexpr (std::is_same_v<T, double>)
                std::cout << "double with value " << arg << '\n';
            else if constexpr (std::is_same_v<T, const char*>)
                std::cout << "std::string with value " << std::quoted(arg) << '\n';
            else 
                static_assert(always_false_v<T>, "non-exhaustive visitor!");
        }, w);
    }
 
    for (auto& v: vec)
    {
        // 4. another type-matching visitor: a class with 3 overloaded operator()'s
        // Note: The `(auto arg)` template operator() will bind to `int` and `long`
        //       in this case, but in its absence the `(double arg)` operator()
        //       *will also* bind to `int` and `long` because both are implicitly
        //       convertible to double. When using this form, care has to be taken
        //       that implicit conversions are handled correctly.
        std::visit(overloaded{
            [](auto arg) { std::cout << arg << ' '; },
            [](double arg) { std::cout << std::fixed << arg << ' '; },
            [](const std::string& arg) { std::cout << std::quoted(arg) << ' '; }
        }, v);
    }
    std::cout<<'\n';

    for (auto& v: vec)
    {
        std::visit(VariantCallable{}, v);
    }
    std::cout<<'\n';

    auto r_iter=vec.rbegin();
    for (auto& v: vec)
    {
        std::visit(VariantCallable{}, v, *r_iter);
        r_iter++; 
    }
    std::cout<<'\n';
}
