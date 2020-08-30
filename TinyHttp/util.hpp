#include <unistd.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <arpa/inet.h>
#include <signal.h>
#include <fcntl.h>
#include <sys/wait.h>
#include <sys/epoll.h>

#include <stdlib.h>
#pragma once
#include <stdio.h>
#include <errno.h>
#include <string.h>
#include <vector>
#include <algorithm>

typedef std::vector<struct epoll_event> EventList;
struct FSException : public std::exception
{
  char mReason[128];
  FSException()
  {
    memset(mReason, 0, sizeof(mReason));
    if(strerror_r(errno, mReason, sizeof(mReason)-1) != 0)
    {
        strcpy(mReason, "Unrecognize FS ERROR");
    }
    printf("%s\n", mReason);
  }

  const char * what () const throw ()
  {
    return mReason;
  }
};

int do_epoll_create(int epoll_size=1024);
int do_listen(int port_);
void setNonblock(int fd);

inline ssize_t writen(int fd, const void *buf, size_t count)
{
    size_t nleft=count;
    ssize_t nwritten;
    const char *bufp=(const char*)buf;

    while(nleft>0)
    {
        if((nwritten=write(fd,bufp,nleft))<0)
        {
            if(errno==EINTR)
                continue;
            printf("Failed to write %d\n", fd);
            return -1;
        }
        else if(nwritten==0)
            continue;

        bufp+=nwritten;
        nleft-=nwritten;
    }
    return count;
}

inline ssize_t recvAll(int sockfd,void *buf,size_t len)
{
    while(1)
    {
        int ret=recv(sockfd,buf,len,MSG_PEEK);
        if(ret==-1 && errno==EINTR)
            continue;
        return ret;
    }
}

inline ssize_t readLine(int sockfd,void *buf,size_t maxline)
{
    int ret;
    int nread;
    char *bufp=(char *)buf;
    int nleft=maxline;
    char endWord[4] {'\r','\n','\r','\n'}; 
    int *pEndWord = reinterpret_cast<int*>(&endWord);
    while(nleft > 0)
    {
        ret=recvAll(sockfd,bufp,nleft);
        if(ret<0)
            return ret;
        if(ret==0)
        {
            return maxline-nleft;
        }
        nleft -= ret;
        bufp += ret;

        for(int i=0; i<ret; i++)
        {
          int *pCurrent = reinterpret_cast<int*>(bufp+i);
          if(*pCurrent = *pEndWord)
            return maxline-nleft;
        }

    }
    return -1;
}
