#include <stdio.h>
struct String
{
    String(int n) 
    {
        printf("reserve %d bytes\n", n);
    }

    String(const char* p)
    {
        printf("%s\n", __PRETTY_FUNCTION__);
    }

    explicit String(int n, char c)
    //String(int n, char c)
    {
        printf("%s\n", __PRETTY_FUNCTION__);
    }

};

int main()
{
    String s = 'a';
    //String s2 ({10,'a'});
    String s3  {10,'a'};
}
