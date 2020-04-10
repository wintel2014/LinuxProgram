switch_stack_to_huge_page:switch_stack_to_huge_page.o restore_stack.o switch_stack.o
	gcc switch_stack_to_huge_page.o restore_stack.o switch_stack.o -g3 -o $@
switch_stack_to_huge_page.o:switch_stack_to_huge_page.c
	gcc -c $^ -g3

restore_stack.o:restore_stack.S
	gcc -c $^ -g3
switch_stack.o: switch_stack.S  
	gcc -c $^ -g3

clean:
	rm *.o switch_stack_to_huge_page -f

run:
	 echo 128 | sudo tee /proc/sys/vm/nr_hugepages
	./switch_stack_to_huge_page
