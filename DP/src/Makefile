SOURCES := $(wildcard *.cpp)
OBJS := $(patsubst %.cpp, $(BUILD_PATH)/%.o, $(SOURCES))

main : $(OBJS)
	g++ $(CPPFLAGS) $^ -o $@

$(BUILD_PATH)/%.o : %.cpp
	g++ -c $(CPPFLAGS) $< -o $@

$(DEP_PATH)/%.d : %.cpp
	@echo "Generating dependency to $@"
	@rm -f $@; g++ -M $(CPPFLAGS) $< > $@.$$$$;\
	sed 's,\($*\)\.o[ :]*,$(BUILD_PATH)/\1.o $@ :,g' < $@.$$$$ > $@;\
	rm -f $@.$$$$
include $(patsubst %.cpp, $(DEP_PATH)/%.d, $(SOURCES))
