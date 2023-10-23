#include <stdio.h>
struct AA {
    int b;
    int c;
} b = { 3, 3 };

long g_var = 0x1234567890abcdef;
int main();

void foodlopen()
{
    printf("foodlopen:\t(&b)=%p\n\tsizeof(b)=%ld\n\tb.a=%d\n\tb.b=%d\n\tmain:%8p g_var:%8p\n",
        &b, sizeof(b), b.b, b.c, main, &g_var);
    b.b = 5;
    b.c = 5;
    printf("foodlopen:\t(&b)=%p\n\tsizeof(b)=%ld\n\tb.a=%d\n\tb.b=%d\n\tmain:%8p g_var:%8p\n",
        &b, sizeof(b), b.b, b.c, main, &g_var);
}
