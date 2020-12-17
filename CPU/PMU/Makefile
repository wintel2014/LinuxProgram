default:
	@g++ rdpmc.cpp -o rdpmc
	@g++ CPUID.cpp -o CPUID

clean:
	rm CPUID rdpmc

	
run: default
	@cat /boot/config-$$(uname -r) | grep CONFIG_X86_MSR
	@sudo modprobe msr
	lsmod | grep msr
	echo 2 | sudo tee /sys/devices/cpu/rdpmc  #CR4.enable for rdpmc
	wrmsr -a 0x38d 0x222 #IA32_FIXED_CTR_CTRL 1:OS 2:user 3:all
	wrmsr -a 0x186 0x414f2e #LLC Reference
	wrmsr -a 0x187 0x41412e #LLC Miss
	wrmsr -a 0x188 0x4100c4 #Branch retired
	wrmsr -a 0x189 0x4100c5 #Branch miss retired
	rdmsr -a 0x38d
	rdmsr -a 0x38f
	./rdpmc
