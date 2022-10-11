main : $(BUILD_PATH)/main.o
	g++ $(CPPFLAGS) $^ -o $@

$(BUILD_PATH)/%.o : %.cpp
	@echo $(BUILD_PATH)
	g++ -c $(CPPFLAGS) $< -o $@

