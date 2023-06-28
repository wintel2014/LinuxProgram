test_class.so: test_class_wrapper.cpp test_class.cpp test_class.h
	g++ -fPIC -shared test_class_wrapper.cpp   test_class.cpp -I/usr/include/python3.8/ -o  test_class.so -lboost_python38 -I/usr/lib/x86_64-linux-gnu/

clean:
	rm -f *.so

