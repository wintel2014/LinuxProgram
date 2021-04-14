all : continuation_dyn continuation_static
	ldd continuation_dyn | grep libboost_context
	ldd continuation_static | grep libboost_context | wc

continuation_dyn : continuation.cpp
	g++ $^ -lboost_context  -L/usr/lib/x86_64-linux-gnu/ -o $@  -g3
	g++ $^ -lboost_context -o $@ -g3

continuation_static : continuation.cpp
	g++ $^ /usr/lib/x86_64-linux-gnu/libboost_context.a -o $@ -g3 -no-pie

clean:
	rm continuation_dyn continuation_static
