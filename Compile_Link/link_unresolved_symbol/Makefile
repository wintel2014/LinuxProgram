dummy:
	@echo "calculate in compile time"
	gcc integer_literal.c
	#gcc -lm variable.c #failed to link
	@echo "The unresolved symbol must be processed before the provider for LINKER"
	gcc variable.c -lm
