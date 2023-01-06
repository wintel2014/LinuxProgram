#include <stdio.h>
struct AA {
    int a;
    int b;
} b = { 3, 3 };

long g_var = 0x1234567890abcdef;
int main();
void foo()
{
    b.a = 4;
    b.b = 4;
    printf("foo:\t(&b)=%p\n\tsizeof(b)=%ld\n\tb.a=%d\n\tb.b=%d\n\tmain:%8p g_var:%8p\n",
        &b, sizeof(b), b.a, b.b, main, &g_var);
}
