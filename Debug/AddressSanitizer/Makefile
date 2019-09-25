heap_use_after_free:heap_use_after_free.cpp
	gcc $^ -o $@ -fsanitize=address
	ldd $@ | grep libasan
