test:link_script_test.cpp
	g++ link_script_test.cpp -T ld.S -g3

GenerateScript:
	ld --verbose | grep -v "========" | sed '1,13d'  > ld.S
