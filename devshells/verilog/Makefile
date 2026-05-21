COMPILER = iverilog
SIMULATOR = vvp
WAVEFORM_VIEWER = surfer

SRC_DIR = src
BUILD_DIR = build

ALL_SV = $(wildcard $(SRC_DIR)/*.sv)
TEST_BENCH = $(wildcard $(SRC_DIR)/tb_*.sv)
DESIGN = $(filter-out $(TEST_BENCH), $(ALL_SV))

OUTPUT = $(BUILD_DIR)/sim.vvp
WAVEFORM = $(BUILD_DIR)/waveform.vcd

all: view

$(BUILD_DIR):
	mkdir -p $(BUILD_DIR)

$(OUTPUT): $(DESIGN) $(TEST_BENCH) | $(BUILD_DIR)
	$(COMPILER) -Wall -o $(OUTPUT) $(DESIGN) $(TEST_BENCH)

$(WAVEFORM): $(OUTPUT)
	$(SIMULATOR) $(OUTPUT)

view: $(WAVEFORM)
	pkill $(WAVEFORM_VIEWER) || true
	nohup $(WAVEFORM_VIEWER) $(WAVEFORM) >/dev/null 2>&1 &

clean:
	pkill $(WAVEFORM_VIEWER) || true
	rm -rf $(BUILD_DIR)

.PHONY: all view clean
