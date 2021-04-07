https://elixir.bootlin.com/linux/latest/source/kernel/futex.c#L2683
static int futex_wait(u32 __user *uaddr, unsigned int flags, u32 val,
		      ktime_t *abs_time, u32 bitset)
{
	/* queue_me and wait for wakeup, timeout, or a signal. */
	futex_wait_queue_me(hb, &q, to);

	/* If we were woken (and unqueued), we succeeded, whatever. */
	ret = 0;
	/* unqueue_me() drops q.key ref */                                                
	if (!unqueue_me(&q))
		goto out;                                  //wakeup by another thread, and removed it from queue
	ret = -ETIMEDOUT;
	if (to && !to->task)
		goto out;                                  //Time out

	/*
	 * We expect signal_pending(current), but we might be the
	 * victim of a spurious wakeup as well.
	 */
	if (!signal_pending(current))                //Only wakeup by signal or spurious
		goto retry;

	ret = -ERESTARTSYS;                         //wakeup by signal
	if (!abs_time)
		goto out;

	restart = &current->restart_block;
	restart->futex.uaddr = uaddr;
	restart->futex.val = val;
	restart->futex.time = *abs_time;
	restart->futex.bitset = bitset;
	restart->futex.flags = flags | FLAGS_HAS_TIMEOUT;

	ret = set_restart_fn(restart, futex_wait_restart);  //how to call futex_wait_restart ????

out:
	if (to) {
		hrtimer_cancel(&to->timer);
		destroy_hrtimer_on_stack(&to->timer);
	}
	return ret;
}


/*
spurious wakeup

lock(m)
while(!ready)
{
  cond_wiat(cond, m);
}
unlock(m)                 
                          lock(m)
                          cond_signal(cond)
                          unlock(m)                 


1. multiple wakers send cond_signal concurrently
Thread1                   Thread2                        Thread3

lock(m)
while(!ready)
{
  cond_wait(cond, m);
                          lock(m)
                          ready = true;
                          cond_signal(cond)
                          unlock(m)                 

                                                          lock(m)
                                                          while(!ready)
                                                          {
                                                            cond_wait(cond, m);
                                                          }
         wakeup<-------------- signaling                  ready = false;
                                                          unlock(m)                 
  //get lock of "m"
}
ready = false;
unlock(m)                 
*/
