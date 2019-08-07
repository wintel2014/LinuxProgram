Performance: readTsc_test return_address_stack

readTsc_test:readTsc_test.cpp
	g++ readTsc_test.cpp -O3 -std=c++14 -ftemplate-depth=4096 -g3 -Wnoexcept -o $@

return_address_stack:return_address_stack.cpp
	g++ return_address_stack.cpp -O0 -o $@

clean:
	rm -f  readTsc_test return_address_stack

