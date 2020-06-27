//https://elixir.bootlin.com/linux/v2.6.39/source/include/linux/seqlock.h#L86
static inline void write_seqlock(seqlock_t *sl)
{
    spin_lock(&sl->lock);
    ++sl->sequence;
    smp_wmb();
}

static inline void write_sequnlock(seqlock_t *sl)
{
    smp_wmb();
    sl->sequence++;
    spin_unlock(&sl->lock);
}

static __always_inline unsigned read_seqbegin(const seqlock_t *sl)
{
    unsigned ret;

repeat:
    ret = sl->sequence;
    smp_rmb();
    if (unlikely(ret & 1)) {
        cpu_relax();
        goto repeat;
    }

    return ret;
}

static __always_inline int read_seqretry(const seqlock_t *sl, unsigned start)
{
    smp_rmb();

    return unlikely(sl->sequence != start);
}

static noinline int do_realtime(struct timespec *ts)
{
    unsigned long seq, ns;
    do {
        seq = read_seqbegin(&gtod->lock);
        ts->tv_sec = gtod->wall_time_sec;
        ts->tv_nsec = gtod->wall_time_nsec;
        ns = vgetns();
    } while (unlikely(read_seqretry(&gtod->lock, seq)));
    timespec_add_ns(ts, ns);
    return 0;
}

/*
The barrier_release is necessary in "write_seqlock". the ++seqCnt and "update Obj" can be reordered without it.
if so, even during "update Obj", seqCnt&1==0 still possible.

        Writer1                 Writer2                      Reader1
 write_seqlock:
        spinlock
        ++seqCnt
     barrier_release                      
                 <---------------------------------------  ret = seqCnt
        .......                                            barrier_acquire         
      update Obj                                           if(ret&1) during write operation, need repeat
        ......
 write_sequnlock:
     barrier_release
        ++seqCnt
        spinunlock                                          
                                spinlock      
                                ++seqCnt  
                              barrier_release              repeat:
                                                             ret = seqCnt
                               update Obj                    barrier_acquire

                              barrier_release//sync with reader
                                ++seqCnt
                                spinunlock
                                                           repeat:
                                                             ret = seqCnt //seqCnt&1 ==0 : the write already done
                                                             barrier_acquire  
*/
