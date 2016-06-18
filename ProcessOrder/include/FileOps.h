#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <unistd.h>
#include <stdio.h>
#include <string.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <unistd.h>
#include <stdio.h>
#include <string.h>
#include <errno.h>

#include <sys/mman.h>
// void *mmap(void *addr, size_t length, int prot, int flags,
//                  int fd, off_t offset);

class FileOps {
    public:
        FileOps(const char*, int Flags=O_RDONLY);
        virtual ~FileOps(){ if(mFd) { close(mFd); munmap(mBase, mSize);} }
        int GetFd() const{ return mFd; }
        inline void* GetBase();
        inline size_t GetSize() {return mSize;}
    private:
        const char *mPathName;
        int mFlags;
        const int mMapFlags=MAP_PRIVATE;
        const int mProt=PROT_READ;
        int mFd;
        size_t mSize;
        void *mBase;
};
inline void* FileOps::GetBase()
{
    return mBase;
}
