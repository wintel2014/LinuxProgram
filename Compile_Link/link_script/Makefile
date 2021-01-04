test:link_script_test.cpp
	#ld.S CONSTANT(MAXPAGESIZE) is changed by following
	#g++ link_script_test.cpp -z max-page-size=0x200000 -T ld.S -g3
	g++ link_script_test.cpp -Wl,-zmax-page-size=0x200000 -Wl,-zcommon-page-size=0x1000 -T ld.S -g3

GenerateScript:
	ld --verbose | grep -v "========" | sed '1,13d'  > ld.S
