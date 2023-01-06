#include <stdio.h>
int t2();
void foo();


int b = 1;
int c = 1;
int main()
{
    int count = 2;
    while (count-- > 0) {
        t2();
        foo();
        printf("main:\t(&b)=%8p\n\t(&c)=%8p\n\tsizeof(b)=%ld\n\tb=%d\n\tc=%d\n",
            &b, &c, sizeof(b), b, c);
        printf("\n");
    }
    return 0;
}
