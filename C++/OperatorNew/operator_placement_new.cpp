#include<iostream>
#include<stdlib.h>
using namespace std;

class Base {
    public:
        Base():mInt(0) { cout<<mInt<<endl;}
        Base(int i):mInt(i) {cout<<mInt<<endl;}
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
int main()
{
    // 1. Create the Base object with "operator new" and "placement new"
    void *pMem=operator new(sizeof(Base));
    ConstructBase(pMem, 111);
    
    // 2. "new operator" will call the overloaded "operator new"
    Base *pBase=new Base(123);    
}
