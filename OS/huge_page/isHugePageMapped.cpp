#include "isHugePageMapped.hpp"

alignas(2*1024*1024) char Array[3*1024*1024];
int main()
{
    memset(Array, 0, sizeof(Array));
    printf("[%p, %p) is%s mapped by hugepage\n", Array, Array+2*1024*1024, isHugePageMapping(Array, Array+2*1024*1024) ? "":" not");

}
