#include <iostream>
class Base {};
class Derived : public Base {};


template<typename ...Args>
void Fun();

template<typename T>
void Fun(T & t)
{   
    std::cout<<"Fun1\n";
}

template<typename T>
void Fun(T& t1, T& t2)
{   
    std::cout<<"Fun2\n";
}

template<typename T>
void Fun(T&& t1, T&& t2)
{   
    std::cout<<"Fun3\n";
}

template<typename T>
void Fun(T* t1, T* t2)
{   
    std::cout<<"Fun4\n";
}

template <typename T>
class B{};
template <typename T>
class D : public B<T> {};
template<typename T>
void Fun( B<T>*)
{
    std::cout<<"Fun5\n";
}


int main()
{
    Base b;
    Derived d;
    
    Fun(b);
    Fun(b, b);
    Fun(&b, &b);

    D<Base> d_template;
    Fun(&d_template);
#if 0
    int i = 0;
    long l = 0;
    Fun(i, l); //no matching function for call to ‘Fun(int&, long int&)’
    Fun(&b, &d); //no matching function for call to ‘Fun(Base*, Derived*)
#endif

}

