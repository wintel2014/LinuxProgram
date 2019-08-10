# Comment/uncomment the following line to disable/enable debugging
#DEBUG = y


# Add your debugging flag (or not) to CFLAGS
ifeq ($(DEBUG),y)
  DEBFLAGS = -O -g -DSCULL_DEBUG # "-O" is needed to expand inlines
else
  DEBFLAGS = -O2
endif

EXTRA_CFLAGS += $(DEBFLAGS)
#CFLAGS += -I$(LDDINC)

ifneq ($(KERNELRELEASE),)
# call from kernel build system
$(warning KERNELRELEASE)
scull-objs := main.o pipe.o access.o
obj-m	:= scull.o

else
$(warning running here================)
KERNELDIR ?= /lib/modules/$(shell uname -r)/build
PWD       := $(shell pwd)

modules:
	#$(MAKE) -C $(KERNELDIR) M=$(PWD) LDDINC=$(PWD)/../include modules 
	$(MAKE) -C $(KERNELDIR) M=$(PWD) modules 

endif



clean:
	rm -rf *.o *~ core .depend .*.cmd *.ko *.mod.c .tmp_versions Module.symvers  modules.order scull.mod

depend .depend dep:
	$(CC) $(CFLAGS) -M *.c > .depend


ifeq (.depend,$(wildcard .depend))
include .depend
endif
install:scull.ko
	@DevicesNum=$$(ls -lht /dev/ |wc | gawk '{print $$1}'); echo "There are $$DevicesNum devices in system before install" 
	sudo ./scull_load
	@DevicesNum=$$(ls -lht /dev/ |wc | gawk '{print $$1}'); echo "There are $$DevicesNum devices in system after install"
	@dmesg|grep scull
	@dmesg|grep jiazi 
	cat /proc/devices  | grep scull
uninstall:
	sudo ./scull_unload
