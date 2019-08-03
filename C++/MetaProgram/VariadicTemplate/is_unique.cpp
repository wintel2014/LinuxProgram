#include <iostream>

template <int... Nums>
struct is_unique
{
    static constexpr bool value = true;
};

template <int A, int B, int... Nums>
struct is_unique<A, B, Nums...>
{
   static constexpr bool value = is_unique<A, Nums...>::value; 
};

template <int A, int... Nums>
struct is_unique<A, A, Nums...>
{
    static constexpr bool value = false;
};

template<int A, int B, int...Nums>
struct unique
{
    //static constexpr bool value = is_unique<A, B, Nums...>::value && unique<B, A, Nums...>::value;
};

int main()
{
    //std::cout<<is_unique<1,2,3,4,5>::value<<"\n";
    //std::cout<<is_unique<4,2,3,4,5>::value<<"\n";
    std::cout<<unique<1,2,3,4,5,4>::value<<"\n";
}
