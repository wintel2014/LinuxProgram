#include <stdio.h>
#include <utility>

class Base
{
public:
    Base() = default;
    ~Base() =default;

    Base(const Base&) {printf("Copy Consctructor\n");}
    Base(Base&&) {printf("Move Consctructor\n");}

    Base& operator= (const Base &) {printf("%s", __PRETTY_FUNCTION__); return *this;}
    Base& operator= (Base &&) {printf("%s", __PRETTY_FUNCTION__); return *this;}
};

Base foo()
{
    return Base();
}

const Base C_foo()
{
    return Base();
}

void reference_trait(Base &)
{
    printf("Bind to ref\n");
}
void reference_trait(const Base &)
{
    printf("Bind to const ref\n");
}
void reference_trait(Base &&)
{
    printf("Bind to right ref\n");
}
int main()
{
    Base b;
    Base&& rref=foo();
    //Base&& rref_2 = rref;  cannot bind rvalue reference of type ‘Base&&’ to lvalue of type ‘Base’
    const Base&& rref2=C_foo();
    //Base&& rref2=C_foo(); binding reference of type ‘Base&&’ to ‘const Base’ discards qualifiers
    const Base& C_ref =  rref2;
    auto b2=foo();
    const Base C_b;
    //Base&& rref3=C_b; //cannot bind rvalue reference of type ‘Base&&’ to lvalue of type ‘const Base’
    const Base& C_b2 = foo();
    const Base& C_b3 = std::move(foo());
    reference_trait(b);
    reference_trait(C_b);
    reference_trait(Base());
    reference_trait(rref); //Bind to ref

}
