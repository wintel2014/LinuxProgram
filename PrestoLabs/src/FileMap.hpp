#pragma once 
#include "common.hpp"

bool MapFile(const char* fileName, void* &addr, size_t& fileSize);
bool MapFile(int fd, void* &addr);
int CreateFile(const char* fileName, size_t fileLen);

class Map {
public:
    Map():mRawAddr(MAP_FAILED), mAddr(MAP_FAILED), mFileSize(0) {}
    ~Map() 
    {
        if (mAddr!=MAP_FAILED && munmap(mAddr, mFileSize) < 0)
            printf("Failed to munmap:%s\n", strerror(errno));
    }
    bool MapFile(const char* fileName, bool shared = false);
    bool MapFile(const char* fileName, size_t fileLen, bool shared = true);
    size_t size() {return mFileSize;}
    void* addr() {return mAddr;}

private :
    int CreateFile(const char* fileName, size_t fileLen);
    void* mRawAddr; //RED block gor guard mAddr.
    void* mAddr;
    size_t mFileSize;
};
