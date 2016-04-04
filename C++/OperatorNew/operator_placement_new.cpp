#include<iostream>
#include<stdlib.h>
using namespace std;

class Base {
    public:
        Base():mInt(0) { cout<<mInt<<endl;}
        Base(int i):mInt(i) {cout<<mInt<<endl;}
        ~Base() {cout<<"Desctructor\n";}
    private:
        int mInt;
};

void * operator new(size_t size)
{
    cout<<"operator new\n";
    return malloc(size);
}

void *ConstructBase(void* buffer, int mInt)
{
    // Call the constructor by "placement new"
    return new(buffer) Base(mInt);
}

void operator delete (void *p)
{
    free(p);
}

int main()
{
    // 1. Create the Base object with "operator new" and "placement new"
    void *pMem=operator new(sizeof(Base));
    ConstructBase(pMem, 111);
    static_cast<Base*>(pMem)->~Base();
    operator delete(pMem);    

    cout<<"==========================================\n";
    // 2. "new operator" will call the overloaded "operator new"
    Base *pBase=new Base(123);
    delete(pBase);    
}
