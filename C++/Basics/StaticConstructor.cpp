#include <stdio.h>
#include <typeinfo>

template <typename T>
struct Foo
{
    Foo(T arg)
    {
        printf("Constructor arg=%p %s @%p\n", arg, typeid(T).name(), this);
    }
};

struct Student
{
    void ID()
    {
        static Foo<Student*> f(this);
    }
};

template <typename T>
struct TemplateClass
{
    void ID()
    {
        static Foo<TemplateClass<T>*> f(this);
    }
};
int main()
{
    Student s1;
    s1.ID();
    s1.ID();

    Student s2;
    s2.ID();

    printf("\n================================================\n");
    TemplateClass<int> t1;
    TemplateClass<int> t2;
    TemplateClass<float> t3;
    t1.ID();
    t2.ID();
    t3.ID();
}
