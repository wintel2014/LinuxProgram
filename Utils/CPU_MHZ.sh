#CPU_MHZ=$(cat /proc/cpuinfo | grep 'cpu MHz' | head -n 1 | gawk '{print $4}' | gawk -F'.' '{print $1}')
CPU_KHZ=$(cat /sys/devices/system/cpu/cpufreq/policy0/cpuinfo_max_freq)
CPU_MHZ=$(echo "$CPU_KHZ/1000" | bc ) 
echo "CPU_MHZ="$CPU_MHZ 
echo "#define CPU_MHZ ($CPU_MHZ)" > $(dirname $0)/cpu_info.hpp
