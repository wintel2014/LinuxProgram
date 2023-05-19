#include <stdio.h>
#include <stdlib.h>


int main(int argc, char **argv)
{
    printf("hello world\n");
    int val = 0;
    if(argc == 2)
        val = atoi(argv[1]);

    if(val == 1)
            printf("%d\n", val);
    if(val == 2)
            printf("%d\n", val);
    if(val == 3)
            printf("%d\n", val);
    if(val == 4)
            printf("%d\n", val);
    if(val == 5)
            printf("%d\n", val);
    if(argv[0][0]=='t' || val == 6)
            printf("%d\n", val);
    return 0;
}
