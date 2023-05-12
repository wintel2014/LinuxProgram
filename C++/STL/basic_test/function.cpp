#include <functional>
#include <stdio.h>
#include <type_traits>
/*
能否在本地存储, 不能的话，需要new
141        static const bool __stored_locally =
142            (std::is_trivially_copyable_v<_Functor>
143             && sizeof(_Functor) <= _M_max_size  //16
144             && __alignof__(_Functor) <= _M_max_align  //8
145             && (_M_max_align % __alignof__(_Functor) == 0));
*/
void print(int d)
{
    printf("%s %d\n", __PRETTY_FUNCTION__, d);
}
void print2(int d)
{
    printf("%s %d\n", __PRETTY_FUNCTION__, d);
}


class Foo
{
public:
    void operator()(int d) const
    {
        printf("%s %d, %ld\n", __PRETTY_FUNCTION__, d, sizeof(mData1));
    }

    Foo() {}; //Non trivial, but trivial_copyable
    volatile char mData1[8];
private:
    volatile char mData2[8];
};
static_assert(!std::is_trivial_v<Foo>);
static_assert(std::__is_location_invariant<Foo>::value);


class FooNonLocal
{
public:
    void operator()(int d) const
    {
        printf("%s %d\n", __PRETTY_FUNCTION__, d);
    }

    FooNonLocal() = default;
    FooNonLocal(const FooNonLocal&) {}
};
static_assert(!std::__is_location_invariant<FooNonLocal>::value);

int main(int argc, char* argv[])
{
    std::function<void(int)> printF = print;
    printF(argc);
    printF = print2;
    printF(argc);

    Foo foo;
    std::function<void(int)> printF2 = std::bind(&Foo::operator(), foo, std::placeholders::_1);
/*
221   static void
222       _M_init_functor(_Any_data& __functor, _Functor&& __f)
223       { _M_init_functor(__functor, std::move(__f), _Local_storage()); }

246   static void
247       _M_init_functor(_Any_data& __functor, _Functor&& __f, true_type)
248       { ::new (__functor._M_access()) _Functor(std::move(__f)); }
250   static void
251       _M_init_functor(_Any_data& __functor, _Functor&& __f, false_type)
252       { __functor._M_access<_Functor*>() = new _Functor(std::move(__f)); }
*/
    printF2 = Foo{};
    printF2 = FooNonLocal{};

    auto lambda  = [foo](){};
    auto lambda2 = [&foo](){};
    static_assert(sizeof(lambda) == sizeof(foo));
    static_assert(sizeof(lambda2) == 8);
    static_assert(sizeof(printF2) == 32);
}

/*
#0  std::_Function_base::_Base_manager<Foo>::_M_init_functor (__functor=..., __f=...) at /usr/include/c++/9/bits/std_function.h:248
#1  0x0000000000402377 in std::_Function_base::_Base_manager<Foo>::_M_init_functor (__functor=..., __f=...) at /usr/include/c++/9/bits/std_function.h:223
#2  0x0000000000401d33 in std::function<void (int)>::function<Foo, void, void>(Foo) (this=0x7fffffffe820, __f=...) at /usr/include/c++/9/bits/std_function.h:675
#3  0x00000000004017e7 in std::function<void (int)>::operator=<Foo>(Foo&&) (this=0x7fffffffe8d0, __f=...) at /usr/include/c++/9/bits/std_function.h:525
#4  0x000000000040133b in main (argc=1, argv=0x7fffffffea18) at function.cpp:73

#0  __GI___libc_malloc (bytes=1) at malloc.c:3023
#1  0x00007ffff7e82b39 in operator new(unsigned long) () from /lib/x86_64-linux-gnu/libstdc++.so.6
#2  0x0000000000402994 in std::_Function_base::_Base_manager<FooNonLocal>::_M_init_functor (__functor=..., __f=...) at /usr/include/c++/9/bits/std_function.h:252
#3  0x00000000004024fb in std::_Function_base::_Base_manager<FooNonLocal>::_M_init_functor (__functor=..., __f=...) at /usr/include/c++/9/bits/std_function.h:223
#4  0x0000000000401ddb in std::function<void (int)>::function<FooNonLocal, void, void>(FooNonLocal) (this=0x7fffffffe820, __f=...) at /usr/include/c++/9/bits/std_function.h:675
#5  0x0000000000401874 in std::function<void (int)>::operator=<FooNonLocal>(FooNonLocal&&) (this=0x7fffffffe8d0, __f=...) at /usr/include/c++/9/bits/std_function.h:525
#6  0x0000000000401351 in main (argc=1, argv=0x7fffffffea18) at function.cpp:74
*/
