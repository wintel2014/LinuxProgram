#include "static.h"
#include <iostream>

std::string& Show();
int main()
{
    std::cout<<gStrObj;
    std::cout<<Show();
}
