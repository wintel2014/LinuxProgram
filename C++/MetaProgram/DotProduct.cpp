#include <stdio.h>

template<int Dim, typename T>
T dot_product(T* a, T* b)
{
    return *a*(*b) + dot_product<Dim-1, T>(a+1, b+1);
}

template<>
int dot_product<1, int>(int* a, int* b)
{
    return *a * (*b);
}

template<typename T, int N>
constexpr int DimTraits(T(&a)[N])
{
    return N;
}


int main(int argc, char* argv[])
{
    int a[]={1,2,3,4};
    int b[]={argc,argc,argc,argc};

    int ret = dot_product<DimTraits(a)>(a,b);
    printf("%p:%d\n", &ret, ret);
}
