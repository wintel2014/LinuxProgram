#include <string>
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
#include <libgen.h>

using namespace std;
const string FSDir = "/dev/hugepages/";
int main(int argc, char *argv[])
{
    if(argc !=3)
    {
        fprintf(stderr, "Usage:\n\tcp src %s/", FSDir.c_str());
    }
    auto srcPath = argv[1];

    int fd = open(srcPath, O_CREAT | O_RDWR, 0755);
    if (fd<0)
    {
        fprintf(stderr, "open fail:%s\n", strerror(errno));
        return 0;
    }
    struct stat stat;
    if(fstat(fd, &stat)<0)
    {
        fprintf(stderr, "stat fail:%s\n", strerror(errno));
        return 0;
    }
    auto srcSize = stat.st_size;
    char *src_mem = static_cast<char*>(mmap(NULL, srcSize, (PROT_READ | PROT_WRITE), MAP_SHARED, fd, 0));

    if (src_mem == MAP_FAILED)
    {
        fprintf(stderr, "mmap fail:%s", strerror(errno));
        return 0;
    }

    int fd_h_tlb = open((FSDir+basename(srcPath)).c_str(), O_CREAT | O_RDWR, 0755);
    if (fd_h_tlb<0)
    {
        fprintf(stderr, "open fail:%s\n", strerror(errno));
        return 0;
    }

    char *huge_mem = static_cast<char*>(mmap(NULL, srcSize, (PROT_READ | PROT_WRITE), MAP_SHARED, fd_h_tlb, 0));

    if (huge_mem == MAP_FAILED)
    {
        fprintf(stderr, "mmap fail:%s", strerror(errno));
        return 0;
    }

    memcpy(huge_mem, src_mem, srcSize);

    return 0;
}
