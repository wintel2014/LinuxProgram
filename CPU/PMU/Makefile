default:
	@cat /boot/config-$$(uname -r) | grep CONFIG_X86_MSR
	@sudo modprobe msr
	lsmod | grep msr
	@g++ rdpmc.cpp -o rdpmc
	@g++ CPUID.cpp -o CPUID

clean:
	rm CPUID rdpmc
