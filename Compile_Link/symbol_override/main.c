#include <stdio.h>
#include <dlfcn.h>
int t2();
void foo();


int b = 1;
int c = 1;
int main()
{
    int count = 1;
    while (count-- > 0) {
        t2();
        foo();
        printf("main:\t(&b)=%8p\n\t(&c)=%8p\n\tsizeof(b)=%ld\n\tb=%d\n\tc=%d\n",
                &b, &c, sizeof(b), b, c);
        printf("\n");

        void* handle = dlopen("./libfoodlopen.so", RTLD_LAZY|RTLD_LOCAL);
        if (!handle) {
            fprintf(stderr, "Error: %s\n", dlerror());
            return 1;
        }
        // 获取函数指针
        void (*foo_func)();
        foo_func = dlsym(handle, "foodlopen");
        if (!foo_func) {
            fprintf(stderr, "Error: %s\n", dlerror());
            dlclose(handle);
            return 1;
        }

        // 调用函数
        foo_func();

        // 关闭共享库
        dlclose(handle);
    }

    return 0;
}
