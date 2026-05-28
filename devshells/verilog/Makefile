# NOTE: Cheatsheet: https://devhints.io/makefile

COMPILER = iverilog
IVERILOG_FLAGS = -Wall
SIMULATOR = vvp
WAVEFORM_VIEWER = surfer

DESIGN := $(wildcard src/*.sv)
TEST ?= test_001
ACTIVE_TB := $(wildcard tests/$(TEST)/tb_*.sv)
ACTIVE_VVP := build/$(TEST).vvp
ACTIVE_VCD := build/$(TEST).vcd

all: view

mkdir:
	mkdir -p build/

$(ACTIVE_VVP): $(DESIGN) $(ACTIVE_TB) | mkdir
	@echo "  OUTPUT  $(ACTIVE_VVP)"
	@$(COMPILER) $(IVERILOG_FLAGS) -o $@ $(DESIGN) $(ACTIVE_TB)

$(ACTIVE_VCD): $(ACTIVE_VVP)
	@echo "  VVP     $(ACTIVE_VVP)"
	@echo "=== RESULT ==="
	@$(SIMULATOR) $<

view: pkill $(ACTIVE_VCD)
	@echo "  SURFER  $(ACTIVE_VCD)"
	@nohup $(WAVEFORM_VIEWER) $(ACTIVE_VCD) >/dev/null 2>&1 &

pytest:
	@echo "  PYTEST  tests/"
	@pytest

report:
	@echo "  REPORT  tests/"
	@pytest -vvv --md-report --md-report-verbose=2 --md-report-show-duration --md-report-output=REPORT.md

pkill:
	@if pgrep ".surfer-wrapped" >/dev/null 2>&1; then \
		echo "  PKILL   surfer"; \
		pkill .surfer-wrapped; \
	fi

clean: pkill
	@echo "  CLEAN   build/"
	@rm -rf build/

.SILENT: mkdir
.PHONY: all view pytest report pkill clean
