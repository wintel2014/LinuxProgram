#include <iostream>
#include <type_traits>
#include <boost/preprocessor/seq/for_each.hpp>
using namespace std;

struct Foo
{
    int I1;
    char C1;
    //long L1;
    int L1;
};
#define OFFSET(type, mem) reinterpret_cast<unsigned long>(&(reinterpret_cast<type*>(0)->mem))
#define OFFSET_TYPE(type, mem) integral_constant<unsigned long, reinterpret_cast<unsigned long>(&(reinterpret_cast<type*>(0)->mem))>

template<typename... Args>
struct IsPacked;

template<typename I1, typename off1, typename I2, typename off2, typename... Args>
struct IsPacked<I1, off1, I2, off2, Args...>
{
    static constexpr bool value = IsPacked<I2, off2, Args...>::value && (off2::value==(off1::value+sizeof(I1)));
};

template<typename I, typename off>
struct IsPacked<I, off>
{
    static constexpr bool value = true;
};

#define MEMBERS (I1)(C1)
#define TEMPLATE_ARGS(r, TYPE, fields) decltype(TYPE::fields), OFFSET_TYPE(TYPE, fields),
#define IS_PACKED(TYPE, MEMBERS, LAST_ALIGNED_FIED) IsPacked<BOOST_PP_SEQ_FOR_EACH(TEMPLATE_ARGS, TYPE, MEMBERS) decltype(TYPE::LAST_ALIGNED_FIED), OFFSET_TYPE(TYPE, LAST_ALIGNED_FIED)>::value
int main()
{
    std::cout<<boolalpha;
    std::cout<<IsPacked<int, OFFSET_TYPE(Foo, I1), char, OFFSET_TYPE(Foo, C1), long, OFFSET_TYPE(Foo, L1)>::value<<"\n";
    std::cout<<IS_PACKED(Foo, MEMBERS, L1)<<"\n";
}
