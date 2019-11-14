#include <cstdlib>
#include <stdio.h>

int main()
{
    signed char s_c = 0xFF;
    int s_i = s_c;
    printf("%d=0x%X\n",s_i, s_i); //-1=0xFFFFFFFF

    unsigned char us_c = 0xFF;
    s_i = us_c;
    printf("%d=0x%X\n",s_i, s_i); // 255=0xFF

    unsigned int us_i = s_c;
    printf("%u=0x%X\n",us_i, us_i); //4294967295=0xFFFFFFFF
    
    us_i = us_c;
    printf("%u=0x%X\n",us_i, us_i); // 255=0xFF
    
    s_i = s_c+2;
    printf("0x%x\n", s_i);


    s_i = 0xFFFF;
    s_c = s_i;
    us_c = s_i;
    printf("0x%X, 0x%X\n", s_c, us_c); //0xFFFFFFFF, 0xFF

    if(s_i > 0xFFFE)
        printf("cmpl ; jle"); //0xFFFFFFFF, 0xFF
    if(us_c > 0xFE)
        printf("cmpb ; jne"); //0xFFFFFFFF, 0xFF
    
    return 0;
}
