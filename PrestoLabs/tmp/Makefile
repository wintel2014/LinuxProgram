SRCS=$(shell ls *.cpp)
OBJS=$(SRCS:%.cpp=%.o)
DEPS=$(SRCS:%.cpp=%.d)

CFFLAGS=-g3 -Wall -std=c++14
#CFFLAGS=-g3

.PHONY: all clean

all: main

-include $(DEPS)
%.o:%.cpp
	echo $^ 
	g++ -c $(CFFLAGS) $< -o $@ -MMD -MF $*.d -MP

main: $(OBJS)
	g++ $^ -o $@ 

clean:
	rm -f $(OBJS) $(DEPS) main
