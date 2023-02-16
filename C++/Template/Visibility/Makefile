test: visibility_vs_overload_resolution.cpp
	@echo "Normal function is defined after the caller:"
	@g++ visibility_vs_overload_resolution.cpp  && ./a.out
	@echo "\nNormal function is defined before the caller:"
	@g++ visibility_vs_overload_resolution.cpp  -DNORMAL_FUNCTION_DEFINE_FIRST  && ./a.out

