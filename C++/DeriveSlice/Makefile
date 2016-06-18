FILE := VirtualFunc
OBJFLAG := -g

$(FILE).S : $(FILE)
	objdump -DS $< >$@

$(FILE) : $(FILE).cpp
	g++ $(OBJFLAG) $< -o $@ 

clean:
	rm $(FILE)
