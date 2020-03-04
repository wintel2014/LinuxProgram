pid="$1"
for tid in $(ls --color=never /proc/$pid/task)
do
    taskset -p $tid
done
