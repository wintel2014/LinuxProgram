#include <iostream>
#include <type_traits>
#include <stddef.h>

template<typename T>
struct RemoveArray
{
    using type=T;
};

template<typename T, int SIZE>
struct RemoveArray<T[SIZE]>
{
    using type=typename RemoveArray<T>::type;
};

template<typename T>
struct RemoveArray<T[]>
{
    using type=T;
};


int main()
{
    static_assert(std::is_same<int, RemoveArray<int[32]>::type>::value, "int[32] --> int");
    static_assert(std::is_same<int, RemoveArray<int[3][2][5]>::type>::value, "int[3][2][5] --> int");
    static_assert(std::is_same<int, RemoveArray<int[]>::type>::value, "int[] --> int");
    static_assert(std::is_same<int*, RemoveArray<int*[4]>::type>::value, "int*[] --> int*");
}

