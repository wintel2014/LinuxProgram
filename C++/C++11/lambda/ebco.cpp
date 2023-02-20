//empty base class optimization
#include <fstream>
#include <iostream>
#include <memory>
#include <tuple>

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

}
