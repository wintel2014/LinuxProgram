#include <array>
#include <memory>
#include <iostream>

class Base
{
public:
    Base() {}
    Base(const Base&){std::cout<<"Copy Constructor\n";}
    Base(Base&&) {std::cout<<"Move Constructor\n";}
};

int main()
{
    std::array<Base, 10> B;
    auto B2=B;
    auto B3=std::move(B);
}
