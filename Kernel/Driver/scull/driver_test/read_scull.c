#include <stdlib.h>
#include<sys/types.h>
#include<sys/stat.h>
#include<fcntl.h>
#include<unistd.h>

#include<stdio.h>
int main()
{
    char* scull0="/dev/scull0";
    int fd=open(scull0,O_RDONLY);
    if(fd == -1)
    {
        printf("open ERR\n");
        exit(1);
    }
    char buf[100]={0};
    read(fd,buf,sizeof(buf));
    buf[sizeof(buf) - 1]='\0';
    printf("---%s---\n",buf);
}
