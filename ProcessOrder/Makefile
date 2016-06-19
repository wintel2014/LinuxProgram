SRC := $(wildcard *.cpp)
OBJ := $(patsubst %.cpp,%.o,$(SRC))  
HEADER := $(wildcard *.h)
HEADER += $(wildcard ./include/*.h)

CFLAGS := -I./ -I./include -std=c++11
CFLAGS += -DINTEGRITY_VERIFY -DDEBUGV
main: $(OBJ)
	g++ $^ -o $@
%.o:%.cpp  $(HEADER)
	g++ $(CFLAGS)  -c $< -o $@  
run: main
	./main
clean:
	rm  $(OBJ) main
