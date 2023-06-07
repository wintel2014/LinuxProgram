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
        Email tmp;
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
        *(char*) 0 = 'a'; //Never run here
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
/*
当异常被抛出时，会调用已经构造的局部变量的析构函数，然后返回至caller处，继续析构局部变量；直到 catch处停止
构造函数可以抛出异常。
    1.构造函数中抛出异常，会导致析构函数不能被调用，但对象本身已申请到的内存资源会被系统释放（已申请到资源的内部成员变量会被系统依次逆序调用其析构函数）。
    2.因为析构函数不能被调用，所以可能会造成内存泄露或系统资源未被释放。
    3.构造函数中可以抛出异常，但必须保证在构造函数抛出异常之前，把系统资源释放掉，防止内存泄露。
*/
/*
Phone Constructor
Contact constructor!!!
Catch exception: 0x123
Phone Destructor
Catch exception: 1
=======================================
Phone Constructor
Contact constructor!!!
Catch exception: 0x123
Phone Destructor
Catch exception: 1
*/
