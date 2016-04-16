#include<iostream>
using namespace std;

class Base {
    public:
        Base():n(0x123) {}
        virtual void show() {cout<<"This is vitual func\n";}
        void disp() {cout<<"This is not virtual\n";}
    private:
        int n;
};

int main()
{
    Base *pB = new Base();
    pB->show();

    Base *pB2=NULL;
    pB2->disp();
    pB2->show();
}
