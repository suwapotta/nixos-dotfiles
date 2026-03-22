FLAKE_HOST = laptop

all: switch

switch: git
	nh os switch -H ${FLAKE_HOST}

boot: git
	nh os boot -H ${FLAKE_HOST}

dry: git
	nh os switch -H ${FLAKE_HOST} --dry

test: git
	nh os test -H ${FLAKE_HOST}

build-vm: git
	nh os build-vm -H ${FLAKE_HOST}

clean:
	sudo nix-collect-garbage --delete-older-than 7d

nuke:
	nh clean all --ask

update:
	nvim --headless "+Lazy! sync" +qa
	nh os switch -H ${FLAKE_HOST} --update

safety:
	pkill zen-beta || true

git: safety
	git add .

.PHONY: all switch boot dry test build-vm clean nuke update git safety
