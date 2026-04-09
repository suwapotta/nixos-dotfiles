FLAKE_HOST = laptop
NOTIFY = ; status=$$?; bash ./scripts/statusNotify.sh $$status; exit $$status

all: switch

switch: git
	nh os switch -H ${FLAKE_HOST} $(NOTIFY)

boot: git
	nh os boot -H ${FLAKE_HOST} $(NOTIFY)

dry: git
	nh os switch -H ${FLAKE_HOST} --dry $(NOTIFY)

test: git
	nh os test -H ${FLAKE_HOST} $(NOTIFY)

build-vm: git
	nh os build-vm -H ${FLAKE_HOST} $(NOTIFY)

legacy: git
	sudo nixos-rebuild switch --flake ${CURDIR}#${FLAKE_HOST} $(NOTIFY)

clean:
	nh clean all --keep 3 $(NOTIFY)

nuke:
	nh clean all --ask $(NOTIFY)

update: git
	NVIM_APPNAME=lvim nvim --headless "+Lazy! sync" +qa
	nh os switch -H ${FLAKE_HOST} --update $(NOTIFY)

safety:
	pkill zen-beta || true

git: safety
	git add .

.PHONY: all switch boot dry test build-vm legacy clean nuke update git safety
