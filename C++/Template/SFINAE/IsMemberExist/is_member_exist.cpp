#include<iostream>
#include<utility>
#include<type_traits>
 
template<typename T>
struct has_member_fun1
{
  private:
    template<typename U>
    //static auto Check(int) -> decltype( std::declval<U>().fun1(), std::true_type() );
    static auto Check(int) -> decltype( U().fun1(), std::true_type() );

    template<typename U>
    static std::false_type Check(...);
  public:
    enum { value = std::is_same<decltype(Check<T>(0)),std::true_type>::value  };
};

template<typename T>
struct has_member_DataMember
{
 private:
    template<typename U>
    static auto Check(int) -> decltype( std::declval<U>().DataMember,std::true_type() );

    template<typename U>
    static std::false_type Check(...);
 public:
    enum { value = std::is_same<decltype(Check<T>(0)),std::true_type>::value  };
};
 
template <typename T>
struct has_bitfield_bit
{
private:
    template<typename U>
    static auto Check(int) -> decltype(&U::bit, std::false_type());

    template<typename U>
    static std::true_type Check(...);

public:
    enum {value = std::is_same_v<decltype(Check<T>(0)), std::true_type> };

};
struct class1
{
    int DataMember;
    void fun1() { std::cout << "fun1" << std::endl;  }
};
 
struct class2
{
    void fun2() { std::cout << "fun2" << std::endl;  }
    int bit;
};

struct class3
{
    int bit : 2;
};
 
int main()
{
    if( has_member_fun1<class1>::value )
    	std::cout << "fun1 is defined in class1"  << std::endl;
    else
        std::cout << "fun1 is not defined in class1"  << std::endl;
    
 
    if( has_member_fun1<class2>::value )
    	std::cout << "fun1 is defined in class2"  << std::endl;
    else
        std::cout << "fun1 is not defined in class2"  << std::endl;
    
    if( has_member_DataMember<class1>::value )
    	std::cout << "DataMember is defined in class1"  << std::endl;
    else
    	std::cout << "DataMember is not defined in class1"  << std::endl;
 
    if( has_member_DataMember<class2>::value )
    	std::cout << "DataMember is defined in class2"  << std::endl;
    else
    	std::cout << "DataMember is not defined in class2"  << std::endl;

    static_assert(!has_bitfield_bit<class2>::value);
    static_assert( has_bitfield_bit<class3>::value);
    return 0;

}
