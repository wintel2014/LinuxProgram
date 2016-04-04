#include<iostream>
#include<boost/shared_ptr.hpp>
using namespace std;

void ThrowInt()
{
    throw 1;
}
class Phone
{
    public:
        Phone():num(0) { cout<<"Default Phone Constructor\n";}
        Phone(int n):num(n) {cout<<"Phone Constructor\n";}
        
        ~Phone(){cout<<"Phone Destructor\n";}
    private:
        int num;
};

class Email
{
    public:
        Email() {throw 1;}
        ~Email() {cout<<"Email Destructor\n";}
};

class Contact
{
    public:
        Contact(string name, int num);
        // If exception happened the destructor is ignored!!!
        ~Contact() {cout<<"Contact Destructor !!!\n";}
        void show() { cout<<mName<<" "<<endl;}
    private:
        string mName;
        shared_ptr<Phone>  mPhone;
        Email*  mEmail;
};
Contact::Contact(string name, int num):mName(name), mPhone(new Phone(num)),mEmail(static_cast<Email*>((void*)0x123))
{
    cout<<"Contact constructor!!!\n";
    try {
        mEmail = new Email();
        Email tmp();
    }catch(int e) {
        cout<<"Catch exception: "<<mEmail<<endl;
        throw e ;
    }
}

int main()
{
    Contact* C = NULL;
    try {
        C= new Contact("wang", 123);
        C->show();
    }catch(int e) {
        delete C;
        cout<<"Catch exception: "<<e<<endl;
    }
    cout<<"=======================================\n";
    try {
        Contact("Zhang", 1234);
    }catch(int e) {
        cout<<"Catch exception: "<<e<<endl;
    }
}
