#include <stdio.h>
#include <signal.h>
#include <pthread.h>
/*
The wait is still blocked even after signal
kill -USR1 PID

Starting pthread_cond_wait
Signal 10 is handled
Signal 10 is handled
Signal 10 is handled

*/

/*futex_wait is restored when signal handler is returned, no restart_syscall*/

/*
rt_sigaction(SIGUSR1, {sa_handler=0x55555555493a, sa_mask=[USR1], sa_flags=SA_RESTORER|SA_RESTART, sa_restorer=0x155554d5afd0}, {sa_handler=SIG_DFL, sa_mask=[], sa_flags=0}, 8) = 0

write(1, "Starting pthread_cond_wait\n", 27Starting pthread_cond_wait) = 27
futex(0x7fffffffe438, FUTEX_WAIT_PRIVATE, 0, NULL
                                                                                        <------------------------------------------- kill -USR1 PID

) = ? ERESTARTSYS (To be restarted if SA_RESTART is set)
--- SIGUSR1 {si_signo=SIGUSR1, si_code=SI_USER, si_pid=2063, si_uid=1001} ---
write(1, "Signal 10 is handled\n", 21Signal 10 is handled)  = 21
rt_sigreturn({mask=[]})                 = 202
futex(0x7fffffffe438, FUTEX_WAIT_PRIVATE, 0, NULL

*/
void signal_handler(int sig)
{
  printf("Signal %d is handled\n", sig);
}

int main()
{
  int n;
  pthread_mutex_t mut;
  pthread_cond_t cond;

  signal(SIGUSR1, signal_handler);
  pthread_mutex_init(&mut, NULL);
  pthread_cond_init(&cond, NULL);

  pthread_mutex_lock(&mut);
  printf("Starting pthread_cond_wait\n");
  n = pthread_cond_wait(&cond, &mut);
  printf("Wakeup from wait: %d\n", n);
  pthread_mutex_unlock(&mut);

  return 0;
}
