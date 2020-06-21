#!/bin/bash
for governor in $(ls /sys/devices/system/cpu/cpufreq/)
do
    if [[ $governor != 'boost' ]]
    then
        echo performance | sudo tee "/sys/devices/system/cpu/cpufreq/$governor/scaling_governor"
    fi
done


echo -n "max_cstate: "
cat /sys/module/intel_idle/parameters/max_cstate

echo "100% CPU for FIFO"
echo 1000000 | sudo tee /proc/sys/kernel/sched_rt_runtime_us >/dev/null
echo -n "softlockup_panic:"
cat /proc/sys/kernel/softlockup_panic


echo "Stop irqbalance..."
service irqbalance stop

echo "Trying reduce local timer interrupts"
sysctl vm.stat_interval=60
sysctl kernel.watchdog_thresh=60
grep 'CONFIG_HZ=' /boot/config-$(uname -r)

echo -n "watchdog_thresh:"
cat /proc/sys/kernel/watchdog_thresh
grep isolcpus  /etc/default/grub
