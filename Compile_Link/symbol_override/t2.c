#include <stdio.h>
int b;
int c;
int t2()
{
    printf("t2:\t(&b)=%8p\n\t(&c)=%8p\n\tsizeof(b)=%ld\n\tb=%d\n\tc=%d\n",
        &b, &c, sizeof(b), b, c);
    return 0;
}
