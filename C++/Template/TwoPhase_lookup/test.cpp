#include <stdio.h>

#define DEFINE_GLOBAL_FUNCTION 1
#if DEFINE_GLOBAL_FUNCTION
void show()
{
    printf("anonymous::show %d\n", __LINE__);
}
#endif

template<typename T>
class C {
public:
    typename T::type m_data;
    C() : m_data(T::value){
        T t;
        t.template call<3>();
    }
    
};
template<typename T>
class A
{
public:
    void show()
    {
        printf("A::show %d\n", __LINE__);
    }
};

void sum(int)
{
    printf("%s %d\n", __PRETTY_FUNCTION__, __LINE__);
}

template<typename T>
class B:public A<T>
{
public:
    void cal()
    {
        show(); //error: there are no arguments to ‘add’ that depend on a template parameter, so a declaration of ‘add’ must be available
        this->show();

        sum(1);
        sum(T{});
    }
};

void sum(float)
{
    printf("%s %d\n", __PRETTY_FUNCTION__, __LINE__);
}

int main()
{
    B<float> b;
    b.cal();
    sum(float{});
}
