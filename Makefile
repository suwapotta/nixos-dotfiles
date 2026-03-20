FLAKE_HOST = laptop

all: laptop

laptop: git
	nh os switch -H ${FLAKE_HOST}

test-laptop: git
	sudo nixos-rebuild test --flake $(CURDIR)#$(FLAKE_HOST)

sandbox-laptop: git
	sudo nixos-rebuild build-vm --flake $(CURDIR)#$(FLAKE_HOST)

clean:
	sudo nix-collect-garbage --delete-older-than 7d

nuke:
	sudo nix-collect-garbage -d

update:
	nvim --headless "+Lazy! sync" +qa
	nix flake update

git:
	git add .

.PHONY: all laptop test-laptop sandbox-laptop clean nuke update git
