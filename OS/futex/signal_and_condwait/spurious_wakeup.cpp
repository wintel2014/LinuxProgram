#include "../../../Utils/affinity.hpp"
#include <stdio.h>
#include <signal.h>
#include <pthread.h>
#include <thread>
#include <chrono>
#include <atomic>
/*
        CPU0                          CPU1
1. waiter1 blocked

2. waker cond_signal
                                  3.waiter2 got the CPU

4. waiter1 waked up,
   but the pred is false

The test is sensitive to scheduler. pls bear in mind
1. Don't redirect the logs to pipe/file
2. Don't remove the printf @L43
*/
struct Condition
{
  Condition()
  {
    pthread_mutex_init(&mMutex, NULL);
    pthread_cond_init(&mCond, NULL);
  }

  pthread_mutex_t mMutex;
  pthread_cond_t mCond;
};

std::atomic<bool> locked {true};
volatile int tmp;
Condition cond;
bool ready = false;
void Waiter1()
{
  SetAffinity(0);
  pthread_mutex_lock(&cond.mMutex);
  while(!ready)
  {
    pthread_cond_wait(&cond.mCond, &cond.mMutex);
    //cond.mMutext is locked again
    if(!ready)
    {
      printf("Spurious wake up happened\n");
    }
  }
  ready  = false;
  pthread_mutex_unlock(&cond.mMutex);
  printf("Waiter1 exit\n");
}

void Waiter2()
{
  SetAffinity(1);
  while(locked.load( std::memory_order_relaxed));

  pthread_mutex_lock(&cond.mMutex);
  while(!ready)
  {
    pthread_cond_wait(&cond.mCond, &cond.mMutex);
  }
  ready  = false;
  pthread_mutex_unlock(&cond.mMutex);
  //printf("Waiter2 exit\n");
}

void Waker()
{
  SetAffinity(0);
  sched_fifo(); //Grab the CPU from waiter1. Keep it blocked even after cond_signal. i.e. Waiter2 got the oppertunity to run on another the CPU

  pthread_mutex_lock(&cond.mMutex);
  ready  = true;
  pthread_mutex_unlock(&cond.mMutex);

  locked.store(false, std::memory_order_relaxed);
  pthread_cond_signal(&cond.mCond);
  tmp = 0;
  while(tmp++ < 10000);

}

int main()
{
  int n;
  while(1)
  {
    volatile int delay = 0;
    std::thread T1(Waiter1);
  
  //ensure waiter1 already blocked before other threads begining
    locked.store(true, std::memory_order_relaxed);
    while(delay++ < 1000);
  
    std::thread T2(Waiter2);
    std::thread T3(Waker);
    std::this_thread::sleep_for(std::chrono::milliseconds(1));
    std::thread T4(Waker);
    T1.join();
    T2.join();
    T3.join();
    T4.join();
  }
 
  return 0;
}
