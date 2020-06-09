BIN = Peeling_tech cmov_version branch_version
all : $(BIN)
Peeling_tech: Peeling_tech.cpp
	g++ Peeling_tech.cpp  -O3 -g3 -o $@
clean:
	rm $(BIN)

cmov_version: likely.cpp
	g++  likely.cpp -O3 -g3 -mtune=intel -march=skylake  -o $@
branch_version: likely.cpp
	#g++  likely.cpp -O3 -fno-if-conversion -g3 -o $@
	g++  likely.cpp -O3 -mtune=intel -march=skylake -fno-if-conversion -g3 -o $@
