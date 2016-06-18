#include<iostream>
using namespace std;

class Base {
    public:
        Base():count(0){}
        Base(int n):count(n){}
        virtual void Set(int n) {count=n; cout<<"in Base::Set this= "<<this<<endl;}
        int count;
        Base(const Base &) { cout<<"Base Copy Constructor is called\n";}
};


class Derive: public Base {
    public:
        Derive():Base() {}
        Derive(int n):Base(n) {}
        virtual void Set(int n);
        void show() {cout<<"count="<<count<<" size="<<size<<endl;}
    private:
        int size;
};

void Derive::Set(int n)
{
    static_cast<Base>(*this).Set(n);  // <=======Base Copy Constructor is triggered to call!!! Derive::count doesn't change any more
    // Base::Set(n); // <================ Derive::count will be changed
    size=n;
}

int main()
{
    Derive D;
    D.Set(123);
    D.show();
    return 0;
}
