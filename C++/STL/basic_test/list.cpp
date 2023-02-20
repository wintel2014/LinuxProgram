#include <list>
#include <iostream>

int main()
{
    std::list<int> L{1,2,3,4,5,6,7,8,9};
    auto iter = L.begin();
    auto end  = L.end();
    while(iter != end)
    {
        std::cout<<*iter<<' ';
        iter++;
    }
    std::cout<<'\n';

}
