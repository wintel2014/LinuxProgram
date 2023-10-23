#include <cassert>
#include <cstdio>
#include <fstream>
#include <iostream>
#include <memory>
#include <stdexcept>
 
// helper class for runtime polymorphism demo below
struct B
{
    virtual ~B() = default;
 
    virtual void bar() { std::cout << "B::bar\n"; }
};
 
struct D : B
{
    D() { std::cout << "D::D\n"; }
    ~D() { std::cout << "D::~D\n"; }
 
    void bar() override { std::cout << "D::bar\n"; }
};

// a function consuming a unique_ptr can take it by value or by rvalue reference
std::unique_ptr<D> pass_through(std::unique_ptr<D> p)
{
    p->bar();
    return p;
}

int main()
{
    {
        // Create a (uniquely owned) resource
        std::unique_ptr<D> p = std::make_unique<D>();
 
        // Transfer ownership to `pass_through`,
        // which in turn transfers ownership back through the return value
        std::unique_ptr<D> q = pass_through(std::move(p));
 
        // p is now in a moved-from 'empty' state, equal to nullptr
        assert(!p);
    }
}
