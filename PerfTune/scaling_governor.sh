#!/bin/bash
for governer in $(ls /sys/devices/system/cpu/cpufreq/)
do
    if [[ $governer != 'boost' ]]
    then
        echo performance | sudo tee "/sys/devices/system/cpu/cpufreq/$governer/scaling_governor"
    fi
done


echo -n "max_cstate: "
cat /sys/module/intel_idle/parameters/max_cstate
