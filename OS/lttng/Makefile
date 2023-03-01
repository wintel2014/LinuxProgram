app:tp.o app.o
	gcc $^ -o $@ -g3 -llttng-ust -ldl -no-pie

%.o:%.c
	gcc -g3 -c $< -o $@ -I.

clean:
	rm *.o app

