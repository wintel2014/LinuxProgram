FILE_SIZE=$(shell echo "7*1024*1024*1024" | bc)
vm_lock:vm_lock.cpp	
	../../Utils/CPU_MHZ.sh
	g++ vm_lock.cpp -lpthread -o $@

run:vm_lock
	@ulimit  -a | grep "locked memory"
	sudo rm -f /dev/shm/hugefile
	touch /dev/shm/hugefile
	chmod a+rw /dev/shm/hugefile
	truncate -s $(FILE_SIZE) /dev/shm/hugefile
	sudo $(shell pwd)/vm_lock $(FILE_SIZE)&
	sudo $(shell pwd)/vm_lock $(FILE_SIZE)&

quit:
	sudo rm -f /dev/shm/hugefile
	ps aux | grep vm_lock | gawk '{print $$2}' |sudo  xargs kill -9
clean:
	rm vm_lock
