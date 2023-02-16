#include <stdio.h>


template <typename T>
T max (T a, T b)
{
    printf("%s\n", __PRETTY_FUNCTION__);
    return a>b ? a:b;
}

#ifdef NORMAL_FUNCTION_DEFINE_FIRST
int max (int a, int b)
{
    printf("%s\n", __PRETTY_FUNCTION__);
    return a>b ? a:b;
}
#endif

template <typename T1, typename T2>
auto max(T1 a, T2 b)
{
    printf("%s\n", __PRETTY_FUNCTION__);
    return max(a,b);
}


#ifndef NORMAL_FUNCTION_DEFINE_FIRST
int max (int a, int b)
{
    printf("%s\n", __PRETTY_FUNCTION__);
    return a>b ? a:b;
}
#endif


int main()
{
    int a = 1;
    int b=2;

    max<int, int>(a,b);
}
