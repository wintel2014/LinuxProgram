#       -pie
#           Produce a position independent executable on targets that support it.  For predictable results, you must also specify the same set of options used for compilation (-fpie, -fPIE, or model suboptions) when you specify this
#           linker option.
#
#       -no-pie
#           Don't produce a position independent executable.

main: libtest.so main.cpp macro.hpp
	g++ main.cpp -L. -ltest -o $@ -std=gnu++1z -g3 -Wl,-rpath=. -no-pie 

libtest.so: macro.hpp library.cpp
	g++ library.cpp  -fPIC -shared -o libtest.so -std=gnu++1z -g3
clean:
	rm *.so main
