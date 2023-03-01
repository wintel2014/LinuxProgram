#include <stdio.h>

#if DEFINE_GLOBAL_FUNCTION
void show()
{
    printf("anonymous::show\n");
}
#endif

template<typename T>
class A
{
public:
    void show()
    {
        printf("A::show\n");
    }
};

void sum(int)
{
    printf("%s\n", __PRETTY_FUNCTION__);
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
    printf("%s\n", __PRETTY_FUNCTION__);
}

int main()
{
    B<float> b;
    b.cal();
    sum(float{});
}
