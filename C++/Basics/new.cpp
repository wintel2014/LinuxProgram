#include<utility>
#include<iostream>
#include<string>
using namespace std;

template <typename T>
class Foo
{
    public:
        Foo():mID(0){cout<<"default ctor.this="<<this<<" id="<<mID<<endl;}
        Foo(int i):mID(i){cout<<"ctor.this="<<this<<" id="<<mID<<endl;}
        Foo(int i, std::string&& str):mID(i), mData(std::move(str)){cout<<"ctor.this="<<this<<" id="<<mID<<" data="<<mData<<endl;}
        ~Foo() {cout<<"dtor.this="<<this<<" id="<<mID<<endl;}
        static void* operator new(size_t size);
        void* operator new (size_t size, void* ptr) noexcept;
        static void operator delete(void* pdead,size_t size);
        static void* operator new[](size_t size);
        static void operator delete[](void* pdead,size_t size);
        virtual void vf1() {cout<<"Foo1\n";}
        virtual void vf2() {cout<<"Foo2\n";}
        virtual void vf3() {cout<<"Foo3\n";}
    public:
        int mID;
        T mData;
};

template<typename T>
void* Foo<T>::operator new(size_t size)
{
    Foo* p = (Foo *)malloc(size);
    cout<<"overload Foo::operator new"<<endl;
    return p;
}

template<typename T>
void* Foo<T>::operator new(size_t size, void* ptr) noexcept
{
    cout<<"overload operator new[2]"<<endl;
    //(reinterpret_cast<Foo<T>*>(ptr))->Foo();
    return ptr;
}

template<typename T>
void Foo<T>::operator delete(void *pdead,size_t size)
{
    cout<<"overload Foo::operator delete"<<endl;
    free(pdead);
}

template<typename T>
void* Foo<T>::operator new[](size_t size)
{
    Foo* p  = (Foo*)malloc(size);
    cout<<"overlod Foo::operator new[]"<<endl;
    return p;
}

template<typename T>
void Foo<T>::operator delete[](void *pdead, size_t size)
{
    cout<<"overload Foo::operator delete[]"<<endl;
    free(pdead);
}

template<typename T, typename... Args>
void construct(Foo<T>* pObj, Args... args)
{
    new(pObj) Foo<T>(std::forward<Args>(args)...);
}

int main()
{
    std::cout<<"===========================new=================================\n";
    auto  pf = new Foo<string>(7); //overload operator new is called
    //delete pf;

    std::cout<<"\n=========================::new===================================\n";
    auto pf2 = ::new Foo<int>(7); //standard new is called
    //::delete pf2;

    std::cout<<"\n==========================Foo<string>::operator new==================================\n";
    //auto  pf3 = reinterpret_cast<Foo<string>*>(Foo<string>::operator new (sizeof(Foo<string>(7))));
    auto  pf3 = Foo<string>::operator new (sizeof(Foo<string>(7)));

    std::cout<<"\n==========================operator new==================================\n";
    auto  pf4 = operator new (sizeof(Foo<string>(7)));

    std::cout<<"\n==========================placement new==> ::new(ptr)==================================\n";
    ::new(pf3) Foo<string>();
    reinterpret_cast<Foo<string>*>(pf3)->vf1();
    reinterpret_cast<Foo<string>*>(pf3)->vf2();

    std::cout<<"\n==========================placement new==> new(ptr)==================================\n";
    new(pf3) Foo<string>();
    construct(reinterpret_cast<Foo<string>*>(pf3), 1, std::string("ABC"));

    std::cout<<"\n============================================================\n";
    auto pf1 = new Foo<int>[3];
    delete[] pf1;
}
