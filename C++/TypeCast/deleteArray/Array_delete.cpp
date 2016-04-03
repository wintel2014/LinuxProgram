#include<iostream>
using namespace std;
class Base {
    public:
        Base():mInt(0) { cout <<"Base constructor\n";}
        virtual ~Base() {cout<<"Virtual Base Destructor\n";}
    private:
        int mInt;  
};

class Derive : public Base {
    public:
        Derive() {}
        ~Derive() {}
    private:
        string mName;
};
/*
                        pBase is used for delete

             _______
            |10     |
pDerive     |_______|   pBase
----------->|       | <-----------
            |       |
            |       |   pBase+1
            |       | <-----------
pDerive+1   |_______|
----------->|       | 
            |       |   pBae+2
            |       | <-----------
            |       |
pDerive+2   |_______|
----------->|       |   pBase+3
            |       | <-----------
            |       |
            |       |
            |_______|
            
*/


int main()
{
    Derive *pDerive = new Derive[10];
    Base* pBase = pDerive;
    // Core dump!!!! please think about the "memory model" of "new array"
    delete pBase;
}
