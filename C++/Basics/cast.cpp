#include <iostream>
#include <boost/core/demangle.hpp>

using namespace std;

class Base
{
private:
    int value;
public:
    virtual void print()
    {
        cout << "Hello world" << endl;
    }
    Base(int value) :value(value) {};
    Base() = default;
};

class Derived :public Base
{
public:
    void print()
    {
        cout << "hehh" << endl;
    }
};

class Derived2 
{
    virtual void print()
    {
        cout << "Derived2::Hello world" << endl;
    }
};
int main()
{
    Base b(4);
    try
    {
        Derived & p = dynamic_cast<Derived &>(b);
    }
    catch (bad_cast & e)
    {
        cerr << e.what() << endl;
    }

    try
    {
        Derived2 & p = dynamic_cast<Derived2 &>(b);
    }
    catch (bad_cast & e)
    {
        cerr << e.what() << endl;
    }


    Derived* p = dynamic_cast<Derived *>(&b);
    printf("%p \n", p);

    Base* pB = new Derived;
    std::string real_name = boost::core::demangle(typeid(pB).name());
    std::cout << typeid(pB).name() << " => " << real_name << '\n';

    std::string real_name_ref = boost::core::demangle(typeid(*pB).name());
    std::cout << typeid(*pB).name() << " => " << real_name_ref << '\n';
    return 0;
}
