#include<iostream>
using namespace std;

class Base {
    public:
        Base():n(0x123) {}
        explicit Base(int arg):n(arg) {}
        virtual void show(int i=123) {cout<<"VirtualFunc: This is Base\n";}
        void disp(int i=123) {cout<<"This is Base\n";}
        int CompareMember(int t) {return n==t;}
    private:
        int n;
};

class Derive:public Base {
    public:
        Derive():Base() {}
        explicit Derive(int arg): Base(arg){}
        virtual void show(int i=1234) {cout<<"VirtualFuncL: This is Derive\n";}
};

template <typename Class, typename ReturnType, typename ArgType>
class mem_func_obj {
    public:
        typedef ReturnType (Class::*FuncPtr)(ArgType);
        mem_func_obj(FuncPtr p ):mMemFunPtr(p), mArg(0) {}
        mem_func_obj(FuncPtr p, int arg):mMemFunPtr(p), mArg(arg) {}
        ReturnType operator()(Class *ObjPtr, ArgType arg) {return (ObjPtr->*mMemFunPtr)(arg);}
        ReturnType operator()(Class *ObjPtr) {return ((ObjPtr->*mMemFunPtr)(mArg));}
    private:
        FuncPtr mMemFunPtr;
        int mArg;
    
};

// Function Argument Deduction
template <typename Class, typename ReturnType, typename ArgType>
mem_func_obj<Class, ReturnType, ArgType> bind(ReturnType (Class::*FunPtr)(ArgType), int arg=0)
{
    return mem_func_obj<Class, ReturnType, ArgType>(FunPtr, arg);
}

template <typename T, typename CMP>
int find(T start, T end, CMP FunObj)
{
    int index=0;
    while (start+index < end) {
       if (FunObj(start+index)) 
            return index;
       index++;
    }
}


//The second template parameter is Non-type
//if not, it's failed to specialization
template <typename T, T> struct proxy;

template<typename T, typename Ret, typename...Args, Ret(T::*MF)(Args...)>
struct proxy<Ret(T::*)(Args...), MF>
{
  static Ret call (T& obj, Args&&... args)
  {
    return (obj.*MF)(std::forward<Args>(args)...);
  }
  Ret operator () (T& obj, Args&&... args)
  {
    return (obj.*MF)(std::forward<Args>(args)...);
  }
};

int main()
{
    typedef void (Base::*Base_show)(int);
    typedef void (Derive::*Derive_show)(int);

    Base_show pBaseshow = &Base::show;
    Derive_show pDeriveshow = &Derive::show;
    Base B;
    Derive D;
    Base *pB = &B;
    Derive *pD = &D;

    (pB->*pBaseshow)(1);
    (pD->*pDeriveshow)(2);

// The "virtual" is also worked for Member Func Ptr
    pB=pD;
    (pB->*pBaseshow)(3);
    // mem_func_obj<Base, void, int> MemFunc(&Base::show);
    mem_func_obj<Base, void, int > MemFunc=bind(&Base::show);
    MemFunc(pB, 12345);

    Base BaseObjArray[5]={Base(1), Base(2), Base(3), Base(4), Base(5)};
    cout<<"Index="<<find(BaseObjArray, BaseObjArray+5, bind(&Base::CompareMember, 4))<<endl;


    auto callBack = proxy<decltype(&Base::show), &Base::show>::call;
    callBack(B, 12);

    proxy<decltype(&Base::show), &Base::show> p;
    decltype(p)::call(B, 12);
    p(B, 12);
}
