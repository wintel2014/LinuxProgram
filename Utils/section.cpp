#include <stdio.h>


char Array[] __attribute__((section(".TestSection"))) = "This section is added manualy!";

void __attribute__((section(".ColdText"))) Foo1() 
{
    printf("Foo1:%p\n", Foo1);
}

void __attribute__((section(".ColdText"))) Foo2() 
{
    printf("Foo2:%p\n", Foo2);
}
int main()
{
    printf("%s\n", Array);
    printf("main:%p\n", main);
    Foo1();
    Foo2();
}
