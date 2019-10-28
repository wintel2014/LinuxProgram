test:test.cpp
	g++ $^ -O3 -o $@_release
	g++ $^ -g3 -O3 -o $@
	objcopy --only-keep-debug $@ .debug/$@.debug
	strip --strip-debug $@
	cp $@ $@_gnu_debuglink
	objcopy --add-gnu-debuglink=$(PWD)/.debug/test.debug test_gnu_debuglink #in the same dir, the dir is ignored by GDB??
	#gdb symbol-file file #OK!!!
	#gdb directory sourceCodeDir
	#gdb set debug-file-directory debugSymbolDir

test1:test.cpp
	g++ $(PWD)/$^ -g3 -O3 -o $@
	objdump --dwarf=decodedline $@ | head -n 22
	objdump -g $@ | grep DW_AT_name | grep $^
	objdump -g $@ | grep DW_AT_comp_dir

test2:test.cpp
	g++ $^ -g3 -O3 -o $@
	objdump --dwarf=decodedline $@ | head -n 22
	objdump -g $@ | grep DW_AT_name | grep $^
	objdump -g $@ | grep DW_AT_comp_dir
