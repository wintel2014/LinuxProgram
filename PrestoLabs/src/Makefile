SRCS=$(shell ls *.cpp)
OBJS=$(SRCS:%.cpp=%.o)
DEPS=$(SRCS:%.cpp=%.d)

ifeq ($(Rule), Normal)
CFFLAGS=-O3 -g3 -Wall -std=c++14 -DNORMAL_RULE_APPLY -DNDEBUG
BINNAME=main_normal
else
CFFLAGS=-O3 -g3 -Wall -std=c++14 -DNDEBUG
BINNAME=main_auction
endif

.PHONY: all clean

all: $(BINNAME)

-include $(DEPS)
%.o:%.cpp
	@g++ -c $(CFFLAGS) $< -o $@ -MMD -MF $*.d -MP

$(BINNAME): $(OBJS)
	@echo "Linking ......"
	@g++ $^ -o $@ 

run: clean $(BINNAME)
	cp orders.csv /dev/shm
	@echo "Runing ......"
	./$(BINNAME)

clean:
	rm -f $(OBJS) $(DEPS) $(BINNAME)
