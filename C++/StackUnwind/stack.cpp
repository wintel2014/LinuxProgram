#include<iostream>
using namespace std;
// arg1->arg6: rdi rsi rdx rcx r8d r9d ....
// return: rax
double func(long arg1, int arg2, int arg3, int arg4, int arg5, int arg6)
{
    double local=2.0;
    local=arg6/local;
    return (arg1+arg2+arg3+arg4+arg5+local)/1.0;
}

int main()
{
    double result=func(0x111222333, 0x222, 0x333, 0x444, 0x555, 0x666);
    return result;
}
