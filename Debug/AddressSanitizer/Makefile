all : heap_use_after_free global_overflow
heap_use_after_free:heap_use_after_free.cpp
	gcc $^ -o $@ -fsanitize=address -g3
	ldd $@ | grep libasan
global_overflow: global_overflow.cpp
	gcc $^ -o $@ -fsanitize=address -g3
	strace ./$@ 2>&1 | grep MAP_FIXED

clean:
	rm -f heap_use_after_free global_overflow
