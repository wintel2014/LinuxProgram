all : heap_use_after_free global_overflow thread_race

heap_use_after_free:heap_use_after_free.cpp
	gcc $^ -o $@ -fsanitize=address -g3 -no-pie
	ldd $@ | grep libasan
global_overflow: global_overflow.cpp
	gcc $^ -o $@ -fsanitize=address -g3  -no-pie
	strace ./$@ 2>&1 | grep MAP_FIXED

thread_race : thread_race.c
	gcc thread_race.c  -g -pthread -fsanitize=thread -no-pie -o $@


clean:
	rm -f heap_use_after_free global_overflow thread_race
