#include <any>
#include <utility>

#include <any>
#include <iostream>
#include <string>
#include <type_traits>
#include <utility>
 
int main()
{
    // Simple example
 
    auto a1 = std::any(12);
 
    std::cout << "1) a1 is int: " << std::any_cast<int>(a1) << '\n';
 
    try
    {
        auto s = std::any_cast<std::string>(a1); // throws
    }
    catch(const std::bad_any_cast& e)
    {
        std::cout << "2) " << e.what() << '\n';
    }
}
