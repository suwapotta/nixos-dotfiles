# NOTE: Cheatsheet: https://devhints.io/makefile

CXX = g++
CXXFLAGS= -MMD -Wall -Wextra -pedantic -Wshadow
# CXXFLAGS=--std=c++23 -MMD -Wall -Wextra -pedantic -Wshadow
GTEST_FLAGS = -I$(GTEST_INCLUDE) -L$(GTEST_LIB) -lgtest_main -lgtest -pthread

SRC = $(wildcard src/*.cpp)
OBJ = $(patsubst src/%.cpp, build/%.o, $(SRC))
DEP = $(OBJ:%.o=%.d)
OBJ_NO_MAIN = $(filter-out build/main.o, $(OBJ))
TEST_SRC = $(wildcard tests/*.cpp)

EXE = build/main
TEST_EXE = build/testRunner
ARGS ?= test_000

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
	@./$(EXE) $(ARGS)
	@echo "=> Returned $$?."

$(TEST_EXE): $(OBJ_NO_MAIN) $(TEST_SRC)
	@mkdir -p build
	@echo "  CXX     $@"
	@$(CXX) $(CXXFLAGS) $^ $(GTEST_FLAGS) -o $@

pytest: $(EXE)
	@echo "  PYTEST  tests/"
	@pytest

gtest: $(TEST_EXE)
	@echo "  GTEST   tests/"
	@./$(TEST_EXE)

report: $(EXE)
	@echo "  REPORT  tests/"
	@pytest tests/ -vvv --md-report --md-report-verbose=2 --md-report-show-duration --md-report-output=REPORT.md

clean:
	@echo "  CLEAN   build/"
	@rm -rf build

-include $(DEP)

.PHONY: all debug run pytest gtest report clean
