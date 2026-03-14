all:

laptop:
	git add .
	sudo nixos-rebuild switch --flake ./#laptop

test-laptop:
	git add .
	sudo nixos-rebuild test --flake ./#laptop

sandbox-laptop:
	git add .
	sudo nixos-rebuild build-vm --flake ./#laptop

update:
	nix flake update

clean:
	sudo nix-collect-garbage -d

.PHONY: all laptop test-laptop sandbox-laptop update clean
