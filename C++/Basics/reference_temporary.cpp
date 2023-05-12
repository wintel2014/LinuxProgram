#pragma GCC optimize ("Og,inline") 
#include <string>
#include <stdio.h>
using namespace std;

const string& ReturnLocalRef()
{
    return "1234";
}

//extend the lifecyle of local variable on the caller's stack
const string ReturnLocalRef2()
{
    return "1234";
}

int main()
{
    auto& tmp = ReturnLocalRef();
    const string& tmp2 = ReturnLocalRef2();
    printf("%p %p\n",&tmp, &tmp2); //(nil) 0x7ffd14c52f60

}
