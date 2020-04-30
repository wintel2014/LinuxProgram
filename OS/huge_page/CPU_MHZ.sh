# cat /proc/cpuinfo | grep 'cpu MHz' | head -n 1 | gawk '{print $4}' | gawk -F'.' '{print $1}'
../../Utils/test/CPU_MHZ
