#include "static.h"
#include <iostream>

std::string& Show()
{
    return gStrObj;
}
