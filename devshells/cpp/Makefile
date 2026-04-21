# NOTE: Cheatsheet: https://devhints.io/makefile

CXX = g++
# CXXFLAGS=--std=<here> -MMD -Wall -Wextra -pedantic -Wshadow
CXXFLAGS=-MMD -Wall -Wextra -Wshadow

SRC = $(wildcard src/*.cpp)
OBJ = $(patsubst src/%.cpp, build/%.o, $(SRC))
DEP = $(OBJ:%.o=%.d)
EXE = build/main

.PHONY: all debug run clean

all: $(EXE)

debug: CXXFLAGS += -g
debug: all

$(EXE): $(OBJ)
	@echo "  LD      $@"
	@$(CXX) -o $@ $^

build/%.o: src/%.cpp
	@mkdir -p build
	@echo "  CXX     $@"
	@$(CXX) $(CXXFLAGS) -c -o $@ $<

run: $(EXE)
	@echo "  RUN     ${EXE}"
	@echo
	@echo "=== RESULT ==="
	@./$(EXE)
	@echo
	@echo "=> Returned $$?."

clean:
	@echo "  CLEAN   build/"
	@rm -rf build

-include $(DEP)
