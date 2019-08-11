obj-m :=hello.o
hellomodule-objs :=module 
KERNELDIR := /lib/modules/$(shell uname -r)/build
PWD := $(shell pwd)
default:
	$(MAKE) -C $(KERNELDIR) M=$(PWD) modules
clean:
	rm -rf .tmp_versions .hello* *.o *.ko *.mod.c *.symvers *.order

install: hello.ko
	sudo insmod ./hello.ko
	dmesg | grep Hello	
uninstall:
	sudo rmmod ./hello.ko
	dmesg | grep Goodbye
