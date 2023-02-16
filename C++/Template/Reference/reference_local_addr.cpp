#include <cstring>
#include <stdio.h>

#define ERROR_PRONE

template <typename T>
T const& max(T const& a, T const&b)
{
    return b<a ? a:b;
}

char const* max(const char* a, const char* b)
{
    return std::strcmp(b,a) < 0 ? a :b;
}

template <typename T>
#ifdef ERROR_PRONE
    // warning: reference to local variable ‘tmp’ returned [-Wreturn-local-addr]
    T const& max(T const&a, T const& b, T const& c)//返回的是tmp的地址，tmp的生命周期位于函数内部，待函数返回后将会被销毁
#else
    T const max(T const&a, T const& b, T const& c)
#endif
{
    auto tmp = max(
                    max(a,b), 
                    c
                );
    return tmp;
}


int main()
{
    const char* s1="string1";
    const char* s2="string2";
    const char* s3="string3";

#ifdef ERROR_PRONE
    const char* ret1;
#else;
    const char* && ret1 = max(s1, s2, s3);
#endif
    const char* const & ret2 = max(s1, s2, s3); // will extend the temporary "return value" 's life cycle
    const char* ret3 = max(s1, s2, s3);
    printf("s1=%p s2=%p s3=%p\nret=%p %p %p\n", s1, s2, s3, ret1, ret2, ret3);
}
