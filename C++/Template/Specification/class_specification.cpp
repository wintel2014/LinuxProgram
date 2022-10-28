#include <iostream>
#include <stdio.h>
#include <type_traits>

struct Order
{
    unsigned mSeq {123};
};
struct MD
{
    unsigned mSeq {456};
};
struct Trade
{
    unsigned mSeq {789};
};

//函数模板不能重载，所以模板参数个数必须相同
//如果有变长类模板，定长模板类必须为特化版本
template <typename T, typename=void>
struct Packet
{
    void Sequence()
    {
        printf("1\n");
    }

    void Name()
    {
        std::cout << typeid(*this).name()<<"\n";
    }

    T mStorage;
};

template<>
void Packet<MD, int>::Sequence() //偏特化某个成员函数
{
    printf("%u\n", 444);
}


template<typename T>
struct Packet<T, std::enable_if_t<std::is_same_v<T, Order>||std::is_same_v<T, MD>||std::is_same_v<T, Trade>> >
{
    void Sequence()
    {
        printf("%u\n", mStorage.mSeq);
    }

    T mStorage;
};

template<>
void Packet<Trade>::Sequence()
{
    printf("%u\n", 888);
}


template<typename T>
struct Packet<T, bool>
{
    void Sequence()
    {
        printf("bool\n");
    }

};
/*
template<typename T>
struct Packet<T, bool, bool> //wrong number of template arguments (3, should be at least 1)
{
};
*/

int main()
{
    Packet<int> P1;  //overload resolution 阶段选择特化版本的Packet，匹配失败；转换到普通版的类模板
    P1.Sequence();  //1

    Packet<Order> P2; //overload resolution 阶段选择特化版本的Packet，匹配通过
    P2.Sequence();  //123

    Packet<MD, int> P3;
    P3.Sequence();  //444

    Packet<Trade, int> P4;
    P4.Sequence();  //1

    Packet<Trade> P5; //888
    P5.Sequence();

    Packet<Trade, bool> P6; 
    P6.Sequence();

    P1.Name();
    //P2.Name(); ‘struct Packet<Trade>’ has no member named ‘Name’
    P3.Name();
    P4.Name();
    //P5.Name(); ‘struct Packet<Trade>’ has no member named ‘Name’
};
