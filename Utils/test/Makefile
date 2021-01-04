rcu_test:rcu_test.cpp ../rcu.hpp
	g++ rcu_test.cpp -std=c++14 -lpthread -g3 -o $@

Performance: readTsc_test return_address_stack

readTsc_test:readTsc_test.cpp
	g++ readTsc_test.cpp -O3 -std=c++17 -ftemplate-depth=4096 -g3 -Wnoexcept -o $@

return_address_stack:return_address_stack.cpp
	g++ return_address_stack.cpp -O0 -o $@

clean:
	rm -f  readTsc_test return_address_stack core rcu_test
