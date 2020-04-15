#include "FileMap.hpp"
 bool Map::MapFile(const char* fileName, bool shared)
 {
     auto fd = open(fileName,  O_RDONLY);
     if (fd<0)
     {
         printf("Failed to open %s:%s\n", fileName, strerror(errno));
         return false;
     }
 
     struct stat sb;
     if (fstat(fd, &sb) == -1) 
     {
         printf("Failed to fstat %s:%s\n", fileName, strerror(errno));
         return false;
     }
     mFileSize = sb.st_size;
     mAddr = mmap(0, mFileSize, PROT_READ|PROT_WRITE, shared? MAP_SHARED:MAP_PRIVATE, fd, 0);
     close(fd);
 #ifdef VM_LOCKED
     if(mlock(mAddr, len)<0)
     {
         printf("Failed to mlock: %s\n", strerror(errno));
         return false;
     }
 #endif
     if(mAddr == MAP_FAILED)
     {
         printf("Failed to mmap %s: %s\n", fileName, strerror(errno));
         return false;
     }
 //hugetlb is much better if hugepage was already reserved.
     if(madvise(mAddr, mFileSize, MADV_HUGEPAGE) < 0)
     {
         printf("Failed to MADV_HUGEPAGE: %s\n",strerror(errno));
     }
 
     return true;
 }
 
 int Map::CreateFile(const char* fileName, size_t fileLen)
 {
     remove(fileName);
     auto fd = open(fileName, O_RDWR|O_CREAT, S_IRUSR|S_IWUSR);
     if(fd<0)
     {
         printf("Failed to open:%s\n", strerror(errno));
         return -1;
     }
     if(ftruncate(fd, fileLen)<0)
         return -1;
     return fd;
 }
 
 bool Map::MapFile(const char* fileName, size_t fileLen, bool shared)
 {
     auto fd = CreateFile(fileName, fileLen);
     if(fd < 0)
         return false;
     mFileSize = fileLen;
     mAddr = mmap(0, fileLen, PROT_READ|PROT_WRITE, shared?MAP_SHARED:MAP_PRIVATE, fd, 0);
     close(fd);
 #ifdef VM_LOCKED
     if(mlock(mAddr, len)<0)
     {
         printf("Failed to mlock: %s\n", strerror(errno));
         return false;
     }
 #endif
     if(mAddr== MAP_FAILED)
     {
         printf("Failed to mmap %s: %s\n", fileName, strerror(errno));
         return false;
     }
 //hugetlb is much better if hugepage was already reserved.
     if(madvise(mAddr, fileLen, MADV_HUGEPAGE) < 0)
     {
         printf("Failed to MADV_HUGEPAGE: %s\n",strerror(errno));
     }
 
     return true;
 }
