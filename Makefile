all:

git:
	git add .

laptop: git
	sudo nixos-rebuild switch --flake ./#laptop

test-laptop: git
	sudo nixos-rebuild test --flake ./#laptop

sandbox-laptop: git
	sudo nixos-rebuild build-vm --flake ./#laptop

update:
	nix flake update

force-clean:
	sudo nix-collect-garbage -d

.PHONY: all git laptop test-laptop sandbox-laptop update force-clean
