#include <stdio.h>
#include <unistd.h>
#include <pwd.h>
/*
DESCRIPTION
       getuid() returns the real user ID of the calling process.
       geteuid() returns the effective user ID of the calling process.

ERRORS
       These functions are always successful.
*/

int main ()
{
    uid_t id = geteuid(); //These functions are always successful.
    struct passwd *pwd = getpwuid(id);
    puts (pwd->pw_name);
}
