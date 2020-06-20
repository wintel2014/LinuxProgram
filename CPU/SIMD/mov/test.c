#include <stdio.h>

long mov(long* src, long* dest);
int main()
{

    long a[3] = {0x12345678, 0xabcdef0123};
    long b[2] = {0};
    mov((long*)((char*)a+1), b);
    printf("0x%lx 0x%lx\n", b[0], b[1]);

}
