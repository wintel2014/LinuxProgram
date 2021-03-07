#include <sys/types.h>
#include <sys/stat.h>
#include <sys/ioctl.h>
#include <fcntl.h>
#include <stdio.h>
#include <string.h>
#include <errno.h>
#include <sys/mman.h>
#include <stdlib.h>
#include <string.h>
#include <errno.h>

const char *filePath = "/dev/hugepages/test.txt";
constexpr size_t fileSize = 10l*1024*1024;
int main(int argc, char *argv[])
{
    int fd = open(filePath, O_CREAT | O_RDWR, 0755);
    if (fd<0)
    {
        fprintf(stderr, "open fail:%s\n", strerror(errno));
        return 0;
    }
    char *huge_mem = static_cast<char*>(mmap(NULL, fileSize, (PROT_READ | PROT_WRITE), MAP_SHARED, fd, 0));

    if (huge_mem == MAP_FAILED)
    {
        fprintf(stderr, "mmap fail:%s", strerror(errno));
        return 0;
    }
    printf("huge_mem addr = %p\n", huge_mem);
    memset(huge_mem, 'a', 2048*1024*5);

    return 0;
}
