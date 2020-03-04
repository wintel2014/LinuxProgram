#include <iostream>
#include <stdio.h>
#include <string.h>
#include <stdarg.h>

#define NUM_ARGS(...)  (sizeof((int[]){__VA_ARGS__})/sizeof(int))

#define NUM_ARGS2(...) NUM_ARGS_IMPL(__VA_ARGS__, 10, 9, 8, 7, 6, 5, 4, 3, 2, 1)
//                    A1  A2  A3  A4  10   9   8   7   6   5   4  3 2 1
#define NUM_ARGS_IMPL(V0, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, ...) V10

#define CAT_IMPL(FUNC, COUNT) FUNC ## COUNT
#define CAT(FUNC, COUNT) CAT_IMPL(FUNC, COUNT)
#define FOR_EACH(F, ...) CAT(FOR_EACH_, NUM_ARGS2(__VA_ARGS__)) (F, __VA_ARGS__)
#define FOR_EACH_1(F, x) F x
#define FOR_EACH_2(F, x1, x2) F x1 F x2
#define FOR_EACH_3(F, x1, x2, x3) F x1 F x2 F x3
#define FOR_EACH_4(F, x1, x2, x3, x4) F x1 F x2 F x3 F x4

#define DATA (1),(2)
#define FUNC(x)\
    std::cout<<x<<std::endl;

#define MEMBER_FIEDS \
(int, a, 1), \
(int, b, 2), \
(int, c, 3) \

#define DECLARE_MEMBER_VARIABLE(type, name, val) \
    type name {val};

#define EXPAND_MEMBER(...) FOR_EACH(DECLARE_MEMBER_VARIABLE, __VA_ARGS__);
struct Foo
{
    EXPAND_MEMBER(MEMBER_FIEDS);    
};

#define STR(s) #s
#define OFFSET(type, mem) (reinterpret_cast<unsigned long>(&(reinterpret_cast<type*>(0)->mem)))
#define EACH_OFFSET(type, name, val) std::cout<<STR(name)<<" : "<<OFFSET(Foo, name)<<std::endl;

#define SUM(...)  (sum(NUM_ARGS(__VA_ARGS__), __VA_ARGS__))

void sum(int numargs, ...) {
    int     total = 0;
    va_list ap;

    printf("sum() called with %d params:", numargs);
    va_start(ap, numargs);
    while (numargs--)
        total += va_arg(ap, int);
    va_end(ap);

    printf(" %d\n", total);

    return;
}

#define XNAME(n) auto x ## n
#define PRINT_XN(n) printf("x" #n " = 0x%x\n", x ## n);

int main(int argc, char *argv[])
{
    printf("NUM_ARGS %ld %d\n", NUM_ARGS(1,2,3,4), NUM_ARGS2(1,2,3,4));
    SUM(1, 2, 3);
    XNAME(1) = 0x12345678;
    PRINT_XN(1);

    FOR_EACH(FUNC, DATA); 
    std::cout<<"Each member offset\n";
    FOR_EACH(EACH_OFFSET, MEMBER_FIEDS); //FOR_EACH(EACH_OFFSET, (int, a, 1), (int, b, 2), (int, c, 3))
    Foo f;

    return 1;
}

