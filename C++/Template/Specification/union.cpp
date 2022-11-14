#include <new>
#include <stdio.h>
#include <utility>
#include <ext/aligned_buffer.h>

//variant
template<typename _Type, bool = std::is_literal_type_v<_Type>>
struct _Uninitialized;

template<typename _Type>
struct _Uninitialized<_Type, true>
{
    template<typename... _Args>
    constexpr _Uninitialized(std::in_place_index_t<0>, _Args&&... __args)
    : _M_storage(std::forward<_Args>(__args)...)
    { }

    constexpr const _Type& _M_get() const & noexcept
    { return _M_storage; }

    constexpr _Type& _M_get() & noexcept
    { return _M_storage; }

    constexpr const _Type&& _M_get() const && noexcept
    { return std::move(_M_storage); }

    constexpr _Type&& _M_get() && noexcept
    { return std::move(_M_storage); }

    _Type _M_storage;
};

template<typename _Type>
struct _Uninitialized<_Type, false>
{
    template<typename... _Args>
    constexpr _Uninitialized(std::in_place_index_t<0>, _Args&&... __args)
    {
        ::new ((void*)std::addressof(_M_storage)) _Type(std::forward<_Args>(__args)...);
    }

    const _Type& _M_get() const & noexcept
    { return *_M_storage._M_ptr(); }

    _Type& _M_get() & noexcept
    { return *_M_storage._M_ptr(); }

    const _Type&& _M_get() const && noexcept
    { return std::move(*_M_storage._M_ptr()); }

    _Type&& _M_get() && noexcept
    { return std::move(*_M_storage._M_ptr()); }

    //char _M_storage[sizeof(_Type)];
     __gnu_cxx::__aligned_membuf<_Type> _M_storage;
};



template<typename... _Types>
union _Variadic_union { };

template<typename _First, typename... _Rest>
union _Variadic_union<_First, _Rest...>
{
    constexpr _Variadic_union() : _M_rest() { }

    template<typename... _Args>
    constexpr _Variadic_union(std::in_place_index_t<0>, _Args&&... __args)
    : _M_first(std::in_place_index<0>, std::forward<_Args>(__args)...)
    { }

    template<size_t _Np, typename... _Args>
    constexpr _Variadic_union(std::in_place_index_t<_Np>, _Args&&... __args)
    : _M_rest(std::in_place_index<_Np-1>, std::forward<_Args>(__args)...)
    { }

    _Uninitialized<_First> _M_first;
    _Variadic_union<_Rest...> _M_rest;
};

struct Foo1 {};
struct Foo2 {};
struct Foo3 
{
    template<size_t N>
    Foo3(const char (&args) [N]) {printf("%s in %s\n", args, __FUNCTION__);}
};
struct Foo4 {};
int main()
{
    _Variadic_union<char, short, int, long, double> u{std::in_place_index_t<1>{}, 'a'};
    printf("%ld %c %d %ld\n",sizeof(u),
            u._M_first._M_storage, 
            u._M_rest._M_rest._M_first._M_storage, 
            u._M_rest._M_rest._M_rest._M_first._M_storage);

  //_Variadic_union<Foo1, Foo2, Foo3, Foo4> f(std::in_place_index_t<0>{}, "Hello"); error: no matching function for call to ‘Foo1::Foo1(const char [6])’
    _Variadic_union<Foo1, Foo2, Foo3, Foo4> f(std::in_place_index_t<2>{}, "Hello");
}
