#include<iostream>
using namespace std;


class Phone
{
    public:
        Phone():num(0) { cout<<"Default Phone Constructor\n";}
        Phone(int n):num(n) {cout<<"Phone Constructor\n";}
        
        ~Phone(){cout<<"Phone Destructor\n";}
    private:
        int num;
};

void ThrowInt()
{
    Phone p(123);
    throw 1;
}

int main()
{
    try {
        ThrowInt();
    }catch(int i) {
        cout<<"Catch exception: "<<i<<endl;
    }
}
