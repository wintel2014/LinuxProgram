#include <stdio.h>
/*
(1) open(pipefds)
             _____    
   write[1] |     |  read[0]
   ----->   |     |  ----->
            |     |
            |_____|


(2)child_B
    0         ______________ STDIN
                        /
                       /
pipefds[0]    ________/  
*/

int main( )
{
        int child_B, child_C;
        int pipefds[2];   /* pipefds[0] for read, pipefds[1] for write */
        char *args1[ ] = {"/bin/wc", NULL};
        char *args2[ ] = {"/bin/ls", ".",
                NULL};
        /* process A */
        pipe(pipefds); /* create a pipe */
        if (!(child_B = fork( ))) /* fork process B */
        {
                /**** Process B ****/
                close(pipefds[1]); /* close the write end */
                /* redirect stdin */
                close(0);
                dup2(pipefds[0], 0);
                close(pipefds[0]);
                /* exec the target */
                execve("/usr/bin/wc", args1, NULL); /* no return if success */
                printf("pid %d: I am back, something is wrong!\n", getpid());
        }
        /* process A continues */
        close(pipefds[0]); /* close the read end */
        if (!(child_C = fork())) /* fork process C */
        {
                /**** process C ****/
                /* redirect stdout */
                close(1) ;
                dup2(pipefds[1], 1);
                close(pipefds[1]);
                /* exec the target */
                execve("/bin/ls", args2, NULL); /* no return if success */
                printf("pid %d: I am back, something is wrong!\n", getpid( ));
        }
        /* process A continues */
        close(pipefds[1]); /* close the write end */
        wait4(child_B, NULL, 0, NULL); /* wait for process B to finish */
        printf("Done!\n") ;
        return 0;
}

