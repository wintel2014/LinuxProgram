#include <memory>
#include <iostream>
#include <functional>

class Base
{
};

int main()
{

    auto lambda = [](Base *ptr) {std::cout<<ptr<<":"<<sizeof(*ptr)<<"\n";};
    std::unique_ptr<Base, decltype(lambda)> SP1 {new Base, lambda};
    std::cout<<"sizeof unique_ptr="<<sizeof(SP1)<<"\n";

    std::function<void (Base*)> FunObj =  lambda;   
    std::cout<<"sizeof unique_ptr="<<sizeof(std::unique_ptr<Base, decltype(FunObj)>)<<"\n";

    static_assert(sizeof(std::unique_ptr<Base, decltype(FunObj)>) > sizeof(std::unique_ptr<Base, decltype(lambda)>), "lambda deleter can reduce memory");
    return 0;
}
