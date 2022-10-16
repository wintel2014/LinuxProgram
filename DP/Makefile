PROJECT_ROOT_DIR := $(shell pwd)
INCLUDE_PATH := -I$(PROJECT_ROOT_DIR)/include
CPPFLAGS := $(INCLUDE_PATH) -std=c++17 -g3
LDFLAGS := -pthread

BUILD_PATH := $(PROJECT_ROOT_DIR)/build
DEP_PATH := $(PROJECT_ROOT_DIR)/dep

MKDIR := $(shell mkdir -p dep)
MKDIR := $(shell mkdir -p $(BUILD_PATH))
MKDIR := $(shell mkdir -p bin)

all:
	@echo $(PROJECT_ROOT_DIR)
	make -C ./src CPPFLAGS="$(CPPFLAGS)" BUILD_PATH="$(BUILD_PATH)" DEP_PATH="$(DEP_PATH)" LDFLAGS="$(LDFLAGS)"
	make -C test/testcases

clean:
	rm -rf dep build bin
	make  -C test/testcases clean


Test :
	./test/testcases/bin/trader 60366

