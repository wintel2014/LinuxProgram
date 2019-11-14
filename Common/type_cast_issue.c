#include <cstdlib>
#include <stdio.h>
int f_signed(int i)
{
    int j=0;
    for(signed int k=i; k<i+10; ++k)
        ++j;
    return j;
}


int f_unsigned(int i)
{
    int j=0;
    for(unsigned int k=i; k<i+10; ++k)
        ++j;
    return j;
}


int main()
{
    int d =rand();
    printf("RAND_MAX=0x%X\n", RAND_MAX);
    //int d = 0x7ffffff6;
    printf("f_s: %d\n", f_signed(d));
    printf("f_un: %d\n\n", f_unsigned(d));

    d = 0x7fffffff;
    printf("0x%X:\nf_s: %d\n",d, f_signed(d));
    printf("f_un: %d\n\n", f_unsigned(d));

    d = 0xffffffff;
    printf("0x%X:\nf_s: %d\n",d, f_signed(d));
    printf("f_un: %d\n\n", f_unsigned(d));
    return 0;
}
