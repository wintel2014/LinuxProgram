#include<iostream>
#include<string>

template <typename... TS>  
void Log(const char* s, TS... args)  
{
    printf(s, args...);
}


template <typename... TS>  
void LogE(const char* s, TS... args)  
{
    fprintf(stderr, s, args...);
}
