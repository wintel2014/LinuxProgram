#include <iostream>
template<int N>
struct Recursive 
{
    const static size_t value = Recursive<N-1>::value + Recursive<N-2>::value;
};


template<>
struct Recursive<0>
{
    const static int value = 0;
};
template<>
struct Recursive<1>
{
    const static int value = 1;
};

int main()
{
    std::cout<<Recursive<4>::value<<std::endl;
    std::cout<<Recursive<1000>::value<<std::endl;
}
