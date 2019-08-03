#include <iostream>

template <int... Nums>
struct index_of;

template <int A, int B, int... Nums>
struct index_of<A, B, Nums...>
{
   static constexpr size_t index = 1 + index_of<A, Nums...>::index; 
};

template <int A, int... Nums>
struct index_of<A, A, Nums...>
{
    static constexpr size_t index = 0;
};


int main()
{
    std::cout<<index_of<4,2,3,4,5>::index<<"\n";
}
