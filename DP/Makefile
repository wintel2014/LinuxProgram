PROJECT_ROOT_DIR := $(shell pwd)
INCLUDE_PATH := -I$(PROJECT_ROOT_DIR)/include
CPPFLAGS := $(INCLUDE_PATH)

BUILD_PATH := $(PROJECT_ROOT_DIR)/build

MKDIR := $(shell mkdir -p dep)
MKDIR := $(shell mkdir -p $(BUILD_PATH))
MKDIR := $(shell mkdir -p bin)

all:
	@echo $(PROJECT_ROOT_DIR)
	make -C ./src CPPFLAGS=$(CPPFLAGS) BUILD_PATH=$(BUILD_PATH)

clean:
	rm -rf dep build bin

