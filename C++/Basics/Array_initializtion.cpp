#include <stdio.h>
struct FOO{
    int a;
    int b;
    int c;
};

char gVar[1024*1024] {'a'};
int main()
{
    FOO foo1 = {a:1, b:2};
    //FOO foo2 = {b:2, a:1}; designator order for field ‘FOO::a’ does not match declaration order in ‘FOO’
    //FOO foo2 = {.a = 1}; //gcc

    { int array2[12] = {[0] = 1, [1] = 2, [2] = 3}; }
    //int n[5] = {[4]=5,[0]=1,2,3,4}; // holds 1,2,3,4,5
    //int array[12]  {[8] = 3, [0] = 1, [4] = 2}; 
    // int array2[12] = {[0] = 1, [4] = 2, [8] = 3}; 
    
    
    //constexpr int MAX=12;
    //int a[MAX] = {1, 3, 5, 7, 9, [MAX-5] = 8, 6, 4, 2, 0};

    static char var[1024*1024] {'a'};
    static char bss_var[1024*1024];
    //static char var[1024*1024]  = {'a'};
    printf("%p %c-%c-\n", var, var[0], var[1024*1024-2]);                 //0x504060 a--
    printf("%p %c-%c-\n", gVar, gVar[0], gVar[1024*1024-2]);              //0x404060 a--
    printf("%p %c-%c-\n",  bss_var,  bss_var[0], bss_var[1024*1024-2]);   //0x604080 --
   
}
    
