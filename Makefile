# Systems information & Macros
FLAKE_HOST = laptop
NOTIFY = ; status=$$?; bash ./scripts/statusNotify.sh $$status; exit $$status

# ANSI color codes
C_RED   := \033[1;31m
C_GREEN := \033[1;32m
C_BLUE  := \033[1;34m
C_NONE := \033[0m

all: switch

switch: git
	@printf "$(C_BLUE)  󰟁 SWITCH  $(C_NONE) NixOS\n"
	@nh os switch -H ${FLAKE_HOST} $(NOTIFY)

boot: git
	@printf "$(C_BLUE)  󰜉 BOOT    $(C_NONE) NixOS\n"
	@nh os boot -H ${FLAKE_HOST} $(NOTIFY)

dry: git
	@printf "$(C_BLUE)   DRY     $(C_NONE) NixOS\n"
	@nh os switch -H ${FLAKE_HOST} --dry $(NOTIFY)

test: git
	@printf "$(C_BLUE)  󰙨 TEST    $(C_NONE) NixOS\n"
	@nh os test -H ${FLAKE_HOST} $(NOTIFY)

build-vm: git
	@printf "$(C_BLUE)   VM      $(C_NONE) NixOS\n"
	@nh os build-vm -H ${FLAKE_HOST} $(NOTIFY)

legacy: git
	@printf "$(C_BLUE)  󰟁 SWITCH  $(C_NONE) (L) NixOS\n"
	@sudo nixos-rebuild switch --flake ${CURDIR}#${FLAKE_HOST} $(NOTIFY)

clean:
	@printf "$(C_RED)   CLEAN   $(C_NONE) Partial\n"
	@nh clean all --keep 3 $(NOTIFY)

nuke:
	@printf "$(C_RED)   CLEAN   $(C_NONE) All\n"
	@nh clean all --ask $(NOTIFY)

update: git update-devshells
	@printf "$(C_BLUE)   UPDATE  $(C_NONE) lazy.nvim\n"
	@NVIM_APPNAME=lvim nvim --headless "+Lazy! sync" +qa &>/dev/null
	@printf "$(C_BLUE)   UPDATE  $(C_NONE) vim.pack\n"
	@nvim --headless +"lua vim.pack.update()" +w +qa &>/dev/null
	@printf "$(C_BLUE)  󰟁 UPDATE  $(C_NONE) NixOS\n"
	@nh os switch -H ${FLAKE_HOST} --update $(NOTIFY)

update-devshells: git
	@printf "$(C_BLUE)   UPDATE  $(C_NONE) devshells\n"
	@for dir in ./devshell/*; do \
		if [ -f "$$dir/flake.nix" ]; then \
			printf "$(C_GREEN)        ->    $$dir$(C_NONE)\n"; \
			nix flake update --flake $$dir; \
		fi;\
	done
	@echo

safety:
	@if pgrep "zen-beta" >/dev/null 2>&1; then \
		printf "$(C_RED)   PKILL?  $(C_NONE) zen-beta [Y/n]: "; \
		\
		read answer; \
		if [ "$$answer" != "n" ] && [ "$$answer" != "N" ]; then \
			pkill zen-beta; \
			printf "$(C_RED)  󱒼 KILLED  $(C_NONE) zen-beta\n"; \
		else \
			printf "$(C_BLUE)  󰜺 SKIPPED $(C_NONE) zen-beta\n"; \
		fi; \
	fi

git: safety
	@printf "$(C_GREEN)   GIT     $(C_NONE) *\n"
	@git add .

.PHONY: all switch boot dry test build-vm legacy clean nuke update update-devshells git safety
