//empty base class optimization
#include <string>
#include <fstream>
#include <iostream>
#include <memory>
#include <tuple>
#include <type_traits>

void foo (int *ptr)
{
    std::cout << "destroying from a custom deleter...\n";
    delete ptr;
}

int main()
{
   
    {
        auto l= [](int* ptr)
        {
            std::cout << "destroying from a custom deleter...\n";
            delete ptr;
        };
        
        std::unique_ptr<int, void(*)(int*)> p(new int, l);
        std::cout<<sizeof(p)<<'\n';
        
        std::unique_ptr<int, decltype(l)> p2(new int, l);
        std::cout<<sizeof(p2)<<'\n';
        
        std::unique_ptr<int, void(*)(int*)> p3(new int, foo);
        std::cout<<sizeof(p3)<<'\n';
        
    }

    std::tuple< void (*)(int*), void (*)(int*)> t1 = std::make_tuple(&foo, &foo);
    std::tuple< void (*)(int*), void (*)(int*)> t2(&foo, &foo);


    auto add_1 = [] (int x, int y) {return x+y;};
    auto add_2 = [] (int x, int y) {return x+y;};
    std::cout<<"std::is_same_v<decltype(add_1), decltype(add_2)>="<<std::is_same_v<decltype(add_1), decltype(add_2)> <<'\n';

    long x, y;
    auto capture_size = [x, y] () {return x+y;};
    std::cout << "sizeof(capture_size)="<<sizeof(capture_size)<<'\n';


    auto add_3 = [] (auto x, auto y) {return x+y;};
    std::cout<<add_3(1.12,2)<<'\n';
    std::cout<<add_3(1231l,2.1)<<'\n';
    std::cout<<add_3(std::string("123"), std::string("456"))<<'\n';
    /*
    add_3() 的调用会生成3个函数实例

    0x0000000000401521 <+451>:   callq  0x401324 <<lambda(auto:1, auto:2)>::operator()<double, int>(double, int) const>
    0x000000000040153a <+476>:   callq  0x401140 <std::basic_ostream<char, std::char_traits<char> >& std::operator<< <std::char_traits<char> >(std::basic_ostream<char, std::char_traits<char> >&, char)@plt>
    0x00000000004028fa <+708>:   callq  0x4025de <<lambda(auto:1, auto:2)>::operator()<std::__cxx11::basic_string<char>, std::__cxx11::basic_string<char> >(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >) const>


    class lambda_add_3 {
    public:
        lambda_add_3();
        template <typename T1, typename T2>
        auto operator() (T1 x, T2, y) const {
            return x+y;
        }
    };


    */
}
