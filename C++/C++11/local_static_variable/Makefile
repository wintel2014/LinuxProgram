all: remove_cxa_guard keep_cxa_guard
remove_cxa_guard:static_test.cpp
	g++ $<  -g3 -lpthread -fno-threadsafe-statics -O0 -o $@
	nm -aC $@ | grep local_static_f
keep_cxa_guard:	static_test.cpp
	g++ static_test.cpp  -g3 -lpthread -O0 -o $@
	nm -aC $@ | grep local_static_f

clean:
	rm remove_cxa_guard keep_cxa_guard

debug:all
	gdb keep_cxa_guard -batch -x gdb_cmd

