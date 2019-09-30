test_wrap : *.cpp
	g++ -c *.cpp
	g++ -o $@ *.o -O2 -Wall -Wl,--wrap=malloc -Wl,--wrap=free -Wl,--wrap=foo -Wl,--wrap=_Znwm -Wl,--wrap=_ZdlPv
	./$@
clean:
	rm *.o
	rm test_wrap
