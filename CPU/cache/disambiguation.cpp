#include <string.h>

#include <iostream>
#include <thread>
#include <chrono>
#include "../../Utils/readTsc.hpp"
#include "../../Utils/affinity.hpp"

char gArray[8*1024];

int main(int argc,  char* argv[])
{
    SetAffinity(3);
    memset(gArray, argc, sizeof(gArray));
    auto pChar = (int*)gArray;
    auto pCharAlias = (int*)(gArray+4096);

    long ret = 0;
#if 1
    auto start = readTsc();
    for(int i=0; i<1000000; i++)
    {
        *pCharAlias = i+2;
        ret += *pChar;
        *(pCharAlias+1)= i+3;
        ret += *(pChar+1);
    }
    std::cout<<ret<<": "<<readTsc()-start<< " cycles" <<std::endl;
#endif
#if 1
    start = readTsc();
    for(int i=0; i<1000000; i++)
    {
        *(pChar+1)= i+2;
        ret += *(int*)pChar;
        *(pChar+3)= i+3;
        ret += *(pChar+2);
    }
    std::cout<<ret<<": "<<readTsc()-start<< " cycles" <<std::endl;
#endif
}
