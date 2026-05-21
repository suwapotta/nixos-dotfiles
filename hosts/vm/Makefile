# Systems information & Macros
HOST = vm
NOTIFY = ; status=$$?; bash ../../scripts/statusNotify.sh $$status; exit $$status

# ANSI color codes
C_RED   := \033[1;31m
C_GREEN := \033[1;32m
C_BLUE  := \033[1;34m
C_NONE := \033[0m

all: run

run: build
	QEMU_KERNEL_PARAMS=console=ttyS0 ./result/bin/run-nixos-vm -nographic; reset

build: git
	@printf "$(C_BLUE)   VM      $(C_NONE) NixOS#${HOST}\n"
	@nh os build-vm -f '<nixpkgs/nixos>' -- -I nixos-config=/home/suwapotta/nixos-dotfiles/hosts/vm/configuration.nix $(NOTIFY)

clean:
	rm -rf result/

git:
	@printf "$(C_GREEN)   GIT     $(C_NONE) *\n"
	@git add -A

.PHONY: all run build clean git
