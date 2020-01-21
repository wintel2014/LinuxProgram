#include <stdio.h>

struct Base
{
    double D;
    int I;
};

struct Derive1
{
    bool I2;
    double D2;
};

struct Derive2: public Base, public Derive1
{
    __int128_t int128;
};


int main()
{
    printf("alignof(__int128_t) = %ld\n", alignof(__int128_t));
    printf("%ld\n", alignof(Base));
    printf("%ld\n", alignof(Derive1));
    printf("%ld\n", alignof(Derive2));
    printf("sizeof(Derive2) = %ld\n", sizeof(Derive2));

    Derive2 D2;
    Derive1* d1 = &D2;
    Base *b = &D2;
    printf("Base:%p, Derive1:%p Derive2:%p\n", b, d1, &D2);
}
