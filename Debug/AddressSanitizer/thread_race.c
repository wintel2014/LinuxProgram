#include <pthread.h>
#include <stdio.h>

int Global;

//#define ENABLE_LOCK
#ifdef ENABLE_LOCK
pthread_mutex_t Gmutex = PTHREAD_MUTEX_INITIALIZER;
#endif

void *Thread1(void *x) {
#ifdef ENABLE_LOCK
    pthread_mutex_lock(&Gmutex);
    Global++;
    pthread_mutex_unlock(&Gmutex);

#else
    Global++;
#endif
    return NULL;
}

void *Thread2(void *x) {
#ifdef ENABLE_LOCK
    pthread_mutex_lock(&Gmutex);
    Global--;
    pthread_mutex_unlock(&Gmutex);
#else
    Global--;
#endif
    return NULL;
}

int main() {
    pthread_t t[2];
    pthread_create(&t[0], NULL, Thread1, NULL);
    pthread_create(&t[1], NULL, Thread2, NULL);
    pthread_join(t[0], NULL);
    pthread_join(t[1], NULL);
}
