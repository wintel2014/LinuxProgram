ulimit -c unlimited
mkdir /var/tmp/cores
echo /var/tmp/cores/core.%e.%p| sudo tee /proc/sys/kernel/core_pattern
echo 1 | sudo tee /proc/sys/fs/suid_dumpable

cat  /proc/sys/kernel/core_pattern
