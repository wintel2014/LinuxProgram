echo 2 | sudo tee  /sys/devices/cpu/rdpmc
sudo modprobe msr
echo  -1 | sudo tee /proc/sys/kernel/perf_event_paranoid
