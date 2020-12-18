echo  -1 | sudo tee /proc/sys/kernel/perf_event_paranoid
#perf list
ls /sys/bus/event_source/devices/cpu/
perf stat -e r412e  -e cpu/event=0x2e,umans=0x41/ -e cache-miss ls
