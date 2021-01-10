# ls /sys/devices/system/cpu/cpu0/cache/ -l
# total 0
# drwxr-xr-x 2 root root    0 Dec 29 10:09 index0
# drwxr-xr-x 2 root root    0 Dec 29 09:10 index1
# drwxr-xr-x 2 root root    0 Dec 29 09:10 index2
# drwxr-xr-x 2 root root    0 Dec 29 10:09 index3

FIRST=$(ls /sys/devices/system/cpu/cpu0/cache/ -l | grep index | head -1| gawk '{print $9}')
FIRST_CAPACITY=$(cat /sys/devices/system/cpu/cpu0/cache/$FIRST/size | sed 's/K/*1024/')
FIRST_LINE_SIZE=$(cat /sys/devices/system/cpu/cpu0/cache/$FIRST/coherency_line_size)
NUM_OF_SETS=$(cat /sys/devices/system/cpu/cpu0/cache/$FIRST/number_of_sets)
WAYS_OF_ASS=$(cat /sys/devices/system/cpu/cpu0/cache/$FIRST/ways_of_associativity)

(
cat << EOF
namespace FIRST {
    constexpr unsigned CAPACITY  = $FIRST_CAPACITY;
    constexpr unsigned LINE_SIZE = $FIRST_LINE_SIZE;
    constexpr unsigned SETS_NUM  = $NUM_OF_SETS;
    constexpr unsigned WAYS_NUM  = $WAYS_OF_ASS;
}
EOF
) > ./cache_info.hpp

MID=$(ls /sys/devices/system/cpu/cpu0/cache/ -l | grep index | head -3| tail -1 |gawk '{print $9}')
MID_CAPACITY=$(cat /sys/devices/system/cpu/cpu0/cache/$MID/size | sed 's/K/*1024/')
MID_LINE_SIZE=$(cat /sys/devices/system/cpu/cpu0/cache/$MID/coherency_line_size)
NUM_OF_SETS=$(cat /sys/devices/system/cpu/cpu0/cache/$MID/number_of_sets)
WAYS_OF_ASS=$(cat /sys/devices/system/cpu/cpu0/cache/$MID/ways_of_associativity)

(
cat << EOF
namespace MID {
    constexpr unsigned CAPACITY  = $MID_CAPACITY;
    constexpr unsigned LINE_SIZE = $MID_LINE_SIZE;
    constexpr unsigned SETS_NUM  = $NUM_OF_SETS;
    constexpr unsigned WAYS_NUM  = $WAYS_OF_ASS;
}
EOF
) >> ./cache_info.hpp


LLC=$(ls /sys/devices/system/cpu/cpu0/cache/ -l | grep index | tail -1| gawk '{print $9}')
LLC_CAPACITY=$(cat /sys/devices/system/cpu/cpu0/cache/$LLC/size | sed 's/K/*1024/')
LLC_LINE_SIZE=$(cat /sys/devices/system/cpu/cpu0/cache/$LLC/coherency_line_size)
NUM_OF_SETS=$(cat /sys/devices/system/cpu/cpu0/cache/$LLC/number_of_sets)
WAYS_OF_ASS=$(cat /sys/devices/system/cpu/cpu0/cache/$LLC/ways_of_associativity)

(
cat << EOF
namespace LLC {
    constexpr unsigned CAPACITY  = $LLC_CAPACITY;
    constexpr unsigned LINE_SIZE = $LLC_LINE_SIZE;
    constexpr unsigned SETS_NUM  = $NUM_OF_SETS;
    constexpr unsigned WAYS_NUM  = $WAYS_OF_ASS;
}
EOF
) >> ./cache_info.hpp
