# Systems information & Macros
FLAKE_HOST = laptop
NOTIFY = ; status=$$?; bash ../../scripts/statusNotify.sh $$status; exit $$status

# ANSI color codes
C_RED   := \033[1;31m
C_GREEN := \033[1;32m
C_BLUE  := \033[1;34m
C_NONE := \033[0m

all: switch

switch: git
	@printf "$(C_BLUE)  󰟁 SWITCH  $(C_NONE) NixOS#${FLAKE_HOST}\n"
	@nh os switch . -H ${FLAKE_HOST} $(NOTIFY)
	@bash ../../scripts/autoCommit.sh

boot: git
	@printf "$(C_BLUE)  󰜉 BOOT    $(C_NONE) NixOS#${FLAKE_HOST}\n"
	@nh os boot . -H ${FLAKE_HOST} $(NOTIFY)

dry: git
	@printf "$(C_BLUE)   DRY     $(C_NONE) NixOS#${FLAKE_HOST}\n"
	@nh os switch . -H ${FLAKE_HOST} --dry $(NOTIFY)

test: git
	@printf "$(C_BLUE)  󰙨 TEST    $(C_NONE) NixOS#${FLAKE_HOST}\n"
	@nh os test . -H ${FLAKE_HOST} $(NOTIFY)

build-vm: git
	@printf "$(C_BLUE)   VM      $(C_NONE) NixOS#${FLAKE_HOST}\n"
	@nh os build-vm . -H ${FLAKE_HOST} $(NOTIFY)

legacy: git
	@printf "$(C_BLUE)  󰟁 SWITCH  $(C_NONE) (L) NixOS#${FLAKE_HOST}\n"
	@sudo nixos-rebuild switch --flake ${CURDIR}#${FLAKE_HOST} $(NOTIFY)
	@bash ../../scripts/autoCommit.sh

clean:
	@printf "$(C_RED)   CLEAN   $(C_NONE) Partial\n"
	@nh clean all --keep 3 $(NOTIFY)

nuke:
	@printf "$(C_RED)   CLEAN   $(C_NONE) All\n"
	@nh clean all --ask $(NOTIFY)

update: git
	@printf "$(C_BLUE)   UPDATE  $(C_NONE) lazy.nvim\n"
	@NVIM_APPNAME=lvim nvim --headless "+Lazy! sync" +qa &>/dev/null
	@printf "$(C_BLUE)   UPDATE  $(C_NONE) vim.pack\n"
	@nvim --headless +"lua vim.pack.update()" +w +qa &>/dev/null
	@printf "$(C_BLUE)  󰟁 UPDATE  $(C_NONE) NixOS#${FLAKE_HOST}\n"
	@nh os switch . -H ${FLAKE_HOST} --update
	@bash ../../scripts/autoCommit.sh
	@if pgrep ".quickshell-wra" >/dev/null 2>&1; then \
		printf "$(C_RED)   PKILL?  $(C_NONE) noctalia-shell [Y/n]: "; \
		\
		read answer; \
		if [ "$$answer" != "n" ] && [ "$$answer" != "N" ]; then \
			kill -15 $$(pgrep ".quickshell-wra") 2>/dev/null || true; \
			nohup noctalia-shell >/dev/null 2>&1 & \
			printf "$(C_BLUE)   RESTART $(C_NONE) noctalia-shell\n"; \
			sleep 3; \
		else \
			printf "$(C_BLUE)  󰜺 SKIPPED $(C_NONE) noctalia-shell\n"; \
		fi; \
	fi $(NOTIFY)

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
	@git add -A

.PHONY: all switch boot dry test build-vm legacy clean nuke update git safety
