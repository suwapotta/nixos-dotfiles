all:

laptop:
	git add .
	sudo nixos-rebuild switch --flake ./#laptop

vm:
	git add .
	sudo nixos-rebuild switch --flake ./#vm

update:
	nix flake update

clean:
	nix-collect-garbage -d

.PHONY: all laptop vm update clean
