#pragma once
#include <stdio.h>
#include <libgen.h>
#include <string.h>
#include <utils.hpp>


#define likely(x)   __builtin_expect(!!(x), 1)  
#define unlikely(x) __builtin_expect(!!(x), 0)
//int fprintf(FILE *stream, const char *format, ...);

//#define LOG_DEBUG(fmt, args...) printf("%s:%d "#fmt, strrchr(__FILE__, '/')+1, __LINE__, ##args);
//#define LOG_INFO(fmt, args...)  printf("%s:%d "#fmt, strrchr(__FILE__, '/')+1, __LINE__, ##args);
//#define LOG_WARN(fmt, args...)  printf("%s:%d "#fmt, strrchr(__FILE__, '/')+1, __LINE__, ##args);
#define LOG_DEBUG(fmt, args...) printf("%s:%d [%d] "#fmt"\n", __FILE__,  __LINE__, gettid(), ##args);
#define LOG_INFO(fmt, args...)  printf("%s:%d [%d] "#fmt"\n", __FILE__,  __LINE__, gettid(), ##args);
#define LOG_WARN(fmt, args...)  printf("%s:%d [%d] "#fmt"\n", __FILE__,  __LINE__, gettid(), ##args);
#define LOG_ERROR(fmt, args...) fprintf(stderr, "%s:%d "#fmt"\n", __FILE__, __LINE__, ##args);

