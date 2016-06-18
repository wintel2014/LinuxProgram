#include<string>
#include<Log.h>
#include<FileOps.h>
FileOps::FileOps(const char *path, int flags):
            mPathName(path),
            mFlags(flags),
            mFd(open(mPathName, mFlags))
{
    if( mFd < 0) {
        LogE("%s: Unable to open %s: %s\n", __func__, mPathName, strerror(errno));
        throw mFd;
    }
    struct stat buf;
    fstat(mFd, &buf);
    mSize=buf.st_size;
    mBase=mmap(NULL, mSize, mProt, mMapFlags, mFd, 0);
    if(mBase == MAP_FAILED) {
        LogE("File is -%s-, fd is %d , size is %d\n", mPathName, mFd, mBase, mSize);
        close(mFd); 
        throw mBase;
    }

    Log("File is -%s-, fd is %d , mBase is %p, size is %d\n", mPathName, mFd, mBase, mSize);
}

