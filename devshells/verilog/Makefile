# WARN: WIP... Use with caution.

COMPILER = iverilog
SIMULATOR = vvp
WAVEFORM_VIEWER = surfer

ALL_SV = $(wildcard *.sv)
TEST_BENCH = $(wildcard tb_*.sv)
DESIGN = $(filter-out $(TEST_BENCH), $(ALL_SV))
OUTPUT = sim.vvp
WAVEFORM = waveform.vcd

all: view

$(OUTPUT): $(DESIGN) $(TEST_BENCH)
	$(COMPILER) $(DESIGN) $(TEST_BENCH) -Wall -o $(OUTPUT)

$(WAVEFORM): $(OUTPUT)
	$(SIMULATOR) $(OUTPUT)

view: $(WAVEFORM)
	pkill $(WAVEFORM_VIEWER) || true
	nohup $(WAVEFORM_VIEWER) $(WAVEFORM) >/dev/null 2>&1 &

clean:
	pkill $(WAVEFORM_VIEWER) || true
	rm -f $(OUTPUT) $(WAVEFORM)
