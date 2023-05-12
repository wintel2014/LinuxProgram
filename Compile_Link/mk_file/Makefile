VAR := A
VAR += B
all: target_mk target_in_func
	@echo $(VAR)
	@echo $(VAR_MK)

-include MK
VAR += C
-include MK2

VAR_MK += ADD_IN_MAKEFILE
