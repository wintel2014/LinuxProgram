PROJECT_ROOT_DIR := $(shell pwd)
DEP_PATH=$(PROJECT_ROOT_DIR)/dep
BUILD_PATH=$(PROJECT_ROOT_DIR)/build

GTEST_ROOT_DIR := $(PROJECT_ROOT_DIR)/../
CPPFLAGS := -I$(GTEST_ROOT_DIR)include -I$(PROJECT_ROOT_DIR)/include -std=c++17
LDFLAGS := -L$(GTEST_ROOT_DIR)/lib -pthread -lgtest

SOURCES := $(wildcard *.cpp)
OBJS := $(patsubst %.cpp, $(BUILD_PATH)/%.o, $(SOURCES))
BINS := $(patsubst %.cpp, $(PROJECT_ROOT_DIR)/bin/%, $(SOURCES))

DUMMY:=$(shell mkdir -p $(PROJECT_ROOT_DIR)/bin )
DUMMY:=$(shell mkdir -p $(PROJECT_ROOT_DIR)/dep )
DUMMY:=$(shell mkdir -p $(PROJECT_ROOT_DIR)/build)

all : $(BINS)
	@echo "compile $(BINS)"

$(PROJECT_ROOT_DIR)/bin/% : $(BUILD_PATH)/%.o
	g++ $< -o $@  $(CPPFLAGS) $(LDFLAGS)
$(BUILD_PATH)/%.o : %.cpp
	g++ -c $(CPPFLAGS) $< -o $@

$(DEP_PATH)/%.d : %.cpp
	@echo "Generating dependency to $@"
	@rm -f $@; g++ -M $(CPPFLAGS) $< > $@.$$$$;\
	sed 's,\($*\)\.o[ :]*,$(BUILD_PATH)/\1.o $@ :,g' < $@.$$$$ > $@;\
	rm -f $@.$$$$
include $(patsubst %.cpp, $(DEP_PATH)/%.d, $(SOURCES))


clean:
	rm -rf build bin dep
