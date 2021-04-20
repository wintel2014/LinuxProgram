modify_in_async2 : modify_in_async_thread2.cpp 
	g++ modify_in_async_thread2.cpp -lpthread  -no-pie -o $@_no_pie
	g++ modify_in_async_thread2.cpp -lpthread  -pie -o $@_pie


clean:
	rm -rf modify_in_async2.*_pie
