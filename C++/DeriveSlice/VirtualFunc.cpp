#include<iostream>
#include<string.h>
using namespace std;

class Base {
    public:
        Base():pCh(NULL) {}
        Base(char *p):pCh(p) {}
        virtual void show() {cout<<"Base: This is vitual func-> "<<pCh<<endl;}
        void disp() {cout<<"Base: This is not virtual-> "<<pCh<<endl;}
    private:
        char *pCh;
};

class Derive:public Base {
    public:
        Derive(): Base(Desc) {strcpy(Desc, "Derive"); }
        virtual void show() {cout<<"Derive: This is vitual func\n";}
    private:
        char Desc[64];
        
        
};

//Different behavior "Base &" and "Base"
// void VirtualFuncTest(Base& B)
void VirtualFuncTest(Base B)
{
    B.show();
    Base *pB=&B;
    pB->show();
    pB->disp();
}

int main()
{
    Derive D;
    VirtualFuncTest(D);
}
