/*
       -fipa-sra
           Perform interprocedural scalar replacement of aggregates, removal of unused parameters and replacement of "parameters passed by reference" by "parameters passed by value".
           Enabled at levels -O2, -O3 and -Os.
        scalar变量 reference传递替换为值传递
        但是会改变string的编译结果，打开该选项会basic_string inline编译；反之，basic_string会使用libstdc++.so.6中的函数
*/

#include <string>
#include <stdio.h>
int main(int argc, const char* argv[])
{
    std::string sso="123";
    printf("%s\n", sso.c_str());

    std::string sso2="1234567890abcdefg";
    printf("%s\n", sso2.c_str());

#ifdef NO_M_construct
    std::string sso3=argv[0];
    printf("%s\n", sso3.c_str());
#endif
}
