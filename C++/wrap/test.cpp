#include <stdio.h>
#include <stdlib.h>
#include <iostream>
#include "wrap.h"
 
int main()
{
	fprintf(stdout, "===== test start =====\n");
 
	char* p1 = (char*)malloc(4);
	free(p1);
 
	foo();
 
	int* p2 = new int;
	delete p2;
 
	fprintf(stdout, "===== test finish =====\n");
	return 0;
}
