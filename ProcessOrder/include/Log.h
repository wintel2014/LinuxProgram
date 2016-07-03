#ifndef INCLUDE_LOG_HEADER
#define INCLUDE_LOG_HEADER
#include<iostream>
#include<string>

template <typename... TS>  
void Log(const char* s, TS... args)  
{
#ifdef DEBUGV
    printf(s, args...);
#endif
}


template <typename... TS>  
void LogE(const char* s, TS... args)  
{
    fprintf(stderr, s, args...);
}
#endif
