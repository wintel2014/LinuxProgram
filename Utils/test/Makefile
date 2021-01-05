rcu_test:rcu_test.cpp ../rcu.hpp
	g++ rcu_test.cpp -std=c++14 -lpthread -g3 -o $@

Performance: readTsc_test return_address_stack

readTsc_test:readTsc_test.cpp
	g++ readTsc_test.cpp -O3 -std=c++17 -ftemplate-depth=4096 -g3 -Wnoexcept -o $@

return_address_stack:return_address_stack.cpp
	g++ return_address_stack.cpp -O0 -o $@

unalign_atomic:unalign_atomic.cpp
	g++ unalign_atomic.cpp -O0 -DATOMIC_CROSS_CACHELINE -o atomic_cross_cacheline -pthread
	g++ unalign_atomic.cpp -O0 -o atomic_in_cacheline -pthread

clean:
	rm -f  readTsc_test return_address_stack core rcu_test atomic_in_cacheline atomic_cross_cacheline  
