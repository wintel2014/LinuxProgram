#include <iostream>

using namespace std;



class Base1
{
public:
    Base1() {cout<<__PRETTY_FUNCTION__<<"\n";}
};
class Base2
{
public:
    Base2() {cout<<__PRETTY_FUNCTION__<<"\n";}
};
class Base3
{
public:
    Base3() {cout<<__PRETTY_FUNCTION__<<"\n";}
};
class Base4
{
public:
    Base4() {cout<<__PRETTY_FUNCTION__<<"\n";}
};

class Base5
{
public:
    Base5() {cout<<__PRETTY_FUNCTION__<<"\n";}
    Base5(int i) {cout<<__PRETTY_FUNCTION__<<"\n";}
};
class Base6
{
public:
    Base6() {cout<<__PRETTY_FUNCTION__<<"\n";}
    Base6(int i) {cout<<__PRETTY_FUNCTION__<<"\n";}
};
class Base7
{
public:
    Base7() {cout<<__PRETTY_FUNCTION__<<"\n";}
    Base7(int i) {cout<<__PRETTY_FUNCTION__<<"\n";}
};

/*
1.virtaul Base class
2.Base class
3.member object
4.Derived Class
Base2::Base2()
Base4::Base4()
Base1::Base1()
Base3::Base3()
Base5::Base5()
Base6::Base6()
Base7::Base7(int)
Derive::Derive()
*/
class Derive: public Base1, virtual public Base2, public Base3, virtual public Base4
{
public:
    Derive(): M3(1) {cout<<__PRETTY_FUNCTION__<<"\n";}
    Base5 M1;
    Base6 M2;
    Base7 M3;
};

int main()
{
    Derive Obj;
}
