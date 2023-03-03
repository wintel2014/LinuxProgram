#include<stdio.h>

char gArray[15] = {0};
int main()
{
    *(int*)(0x12345) = 1;
}
