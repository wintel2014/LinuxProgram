#include <stdio.h>


using namespace std;

auto foo()
{
    int var1 = 1234;
    int var2 = 1234;
    int var3 = 1234;
    int var4 = 1234;
    auto L = [&var1, var2, var3, var4] () {printf("%d %d %d %d\n", var1, var2, var3, var4);};
    L();
    printf("sizeof(lambda)=%ld\n", sizeof(L));
    return L;
}

class Empty: public decltype(foo())
{
};

void PopulateStack()
{
    volatile int i = 0;
    for(int index=0; index<3; index++)
    *(&i-index) = 987654321;
}
int main()
{
    auto L = foo();
    PopulateStack();
    L();

    printf("sizeof(Empty)= %ld\n", sizeof(Empty));
}
