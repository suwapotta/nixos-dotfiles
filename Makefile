FLAKE_HOST = laptop
NOTIFY = ; status=$$?; bash ./scripts/statusNotify.sh $$status; exit $$status

all: switch

switch: git
	@echo "  SWITCH  NixOS"
	@nh os switch -H ${FLAKE_HOST} $(NOTIFY)

boot: git
	@echo "  BOOT    NixOS"
	@nh os boot -H ${FLAKE_HOST} $(NOTIFY)

dry: git
	@echo "  DRY     NixOS"
	@nh os switch -H ${FLAKE_HOST} --dry $(NOTIFY)

test: git
	@echo "  TEST    NixOS"
	@nh os test -H ${FLAKE_HOST} $(NOTIFY)

build-vm: git
	@echo "  VM      NixOS"
	@nh os build-vm -H ${FLAKE_HOST} $(NOTIFY)

legacy: git
	@echo "  SWITCH  (L) NixOS"
	@sudo nixos-rebuild switch --flake ${CURDIR}#${FLAKE_HOST} $(NOTIFY)

clean:
	@echo "  CLEAN   Partial"
	@nh clean all --keep 3 $(NOTIFY)

nuke:
	@echo "  CLEAN   All"
	@nh clean all --ask $(NOTIFY)

update: git update-devshells
	@echo "  UPDATE  lazy.nvim"
	@NVIM_APPNAME=lvim nvim --headless "+Lazy! sync" +qa &>/dev/null
	@echo "  UPDATE  vim.pack"
	@nvim --headless +"lua vim.pack.update()" +w +qa &>/dev/null
	@echo "  UPDATE  NixOS"
	@nh os switch -H ${FLAKE_HOST} --update $(NOTIFY)

update-devshells: git
	@echo "  UPDATE  devshells"
	@for dir in ./devshell/*; do \
		if [ -f "$$dir/flake.nix" ]; then \
			echo "       -> $$dir"; \
			nix flake update --flake $$dir; \
		fi; \
	done

safety:
	@if pgrep "zen-beta" >/dev/null 2>&1; then \
		echo "  PKILL   zen-beta"; \
		pkill zen-beta; \
	fi

git: safety
	@echo "  GIT     *"
	@git add .

.PHONY: all switch boot dry test build-vm legacy clean nuke update update-devshells git safety
