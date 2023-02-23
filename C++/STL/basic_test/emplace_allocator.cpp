#include <vector>
#include <string>
#include <cassert>
#include <iostream>
#include <cstdint>
#include <memory>
 
struct alignas(256) President
{
    std::string name;
    std::string country;
    int year;
 
    President(std::string p_name, std::string p_country, int p_year)
        : name(std::move(p_name)), country(std::move(p_country)), year(p_year)
    {
        std::cout << "I (" << name << ") am being constructed. this="<<this<<"\n";
    }
    President(President&& other)
        : name(std::move(other.name)), country(std::move(other.country)), year(other.year)
    {
        std::cout << "I am being moved. this="<<this<<" other="<<&other<<"\n";
    }
    President& operator=(const President& other) 
    {
        std::cout << "I am being assigned. this="<<this<<" other="<<&other<<"\n";
        return *this;
    }
    President (const President& other) = delete;
};
 
int main()
{
    std::vector<President> elections;
    std::cout << "emplace_back:\n";
    auto& ref = elections.emplace_back("Nelson Mandela", "South Africa", 1994);
    assert(ref.year == 1994 && "uses a reference to the created object (C++17)");
 
    std::vector<President> reElections;
    std::cout << "\npush_back:\n";
    reElections.push_back(President("Franklin Delano Roosevelt", "the USA", 1936));
 
    std::cout << "\nContents:\n";
    for (President const& president: elections) {
        std::cout << president.name << " was elected president of "
                  << president.country << " in " << president.year << ".\n";
    }
    for (President const& president: reElections) {
        std::cout << president.name << " was re-elected president of "
                  << president.country << " in " << president.year << ".\n";
    }


    /*
    0x00000000004028e0 <+1002>:  mov    $0x100,%esi
    0x00000000004028e5 <+1007>:  mov    $0x100,%edi
    0x00000000004028ea <+1012>:  callq  0x402340 <operator new(unsigned long, std::align_val_t)@plt> */
    auto ptr = new President("A", "China", 2023);
    assert(reinterpret_cast<std::uintptr_t>(ptr)%alignof(President) == 0);
    delete(ptr);


    std::allocator<President> alloc;
    using Traits = std::allocator_traits<decltype(alloc)>;
    static_assert(std::is_same_v<President, decltype(alloc)::value_type>);
    auto ptr2 = alloc.allocate(5);                       //只分配，不构造

    Traits::construct(alloc, ptr2, "B", "China", 2023); //执行构造函数
    alloc.construct(ptr2+1, "C", "China", 2023);
    assert(reinterpret_cast<std::uintptr_t>(ptr2)%alignof(President) == 0);
    alloc.destroy(ptr2+1);                              //执行析构函数
    Traits::destroy(alloc, ptr2);
    alloc.deallocate(ptr2, 5);                          //释放内存
    
}
