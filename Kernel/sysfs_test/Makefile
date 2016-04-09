# Comment/uncomment the following line to disable/enable debugging


EXTRA_CFLAGS += -O2
#CFLAGS += -I$(LDDINC)

ifneq ($(KERNELRELEASE),)
# call from kernel build system

scull-objs := sysfs_test.c

obj-m	:= sysfs_test.o

else

KERNELDIR ?= /lib/modules/$(shell uname -r)/build
PWD       := $(shell pwd)

modules:
	#$(MAKE) -C $(KERNELDIR) M=$(PWD) LDDINC=$(PWD)/../include modules 
	$(MAKE) -C $(KERNELDIR) M=$(PWD) modules 

endif



clean:
	rm -rf *.o *~ core .depend .*.cmd *.ko *.mod.c .tmp_versions modules.order Module.symvers

depend .depend dep:
	$(CC) $(CFLAGS) -M *.c > .depend


ifeq (.depend,$(wildcard .depend))
include .depend
endif
install:
	sudo insmod sysfs_test.ko
uninstall:
	 sudo rmmod sysfs_test
