report: test
	./$^ 2
	lcov -c -d . -o test.info --rc lcov_branch_coverage=1 
	genhtml --branch-coverage -o result test.info 
	
test:test.o
	gcc $^ -lgcov -o $@ -g3
test.o:test.c
	gcc $^ -c -fprofile-arcs -ftest-coverage -o $@ -g3

clean:
	rm -rf result test.o *.gcda *.gcno test.info test

