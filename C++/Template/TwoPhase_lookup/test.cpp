#include <stdio.h>

#if 0
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

template<typename T>
class B:public A<T>
{
public:
    void cal()
    {
        show(); //error: there are no arguments to ‘add’ that depend on a template parameter, so a declaration of ‘add’ must be available
        this->show();
    }
};
int main()
{
    B<float> b;
    b.cal();
}
