#include "util.hpp"
int do_epoll_create(int epoll_size)
{
  auto fd = epoll_create(epoll_size);
  if (fd != -1)
    ::fcntl(fd, F_SETFD, FD_CLOEXEC);

  if (fd == -1)
  {
     throw FSException(); 
  }

  return fd;
}

int do_listen(int port_)
{
  int listenFD = -1;
  if((listenFD=socket(AF_INET,SOCK_STREAM,IPPROTO_TCP)) < 0)
  {
    throw FSException();
  } 
  sockaddr_in servaddr;
  memset(&servaddr,0,sizeof(servaddr));
  servaddr.sin_family=AF_INET;
  servaddr.sin_port=htons(port_);
  servaddr.sin_addr.s_addr=htonl(INADDR_ANY);
 
  int on=1;
  if(setsockopt(listenFD,SOL_SOCKET,SO_REUSEADDR,&on,sizeof(on))<0)
  {
    throw FSException();
  }
  if(bind(listenFD,(struct sockaddr*)&servaddr,sizeof(servaddr))<0)
  {
    throw FSException();
  }
  if(listen(listenFD,SOMAXCONN)<0)
  {
    throw FSException();
  }

  return listenFD;
}
void setNonblock(int fd)
{
    int flags=fcntl(fd,F_GETFL);
    if(flags==-1)
      throw FSException();
    flags |= O_NONBLOCK;
    if (-1 == fcntl(fd,F_SETFL,flags))
      throw FSException();
}
