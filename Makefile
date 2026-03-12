all: 

vm:
	git add .
	sudo nixos-rebuild switch --flake ./#NixOS

clean:
	nix-collect-garbage -d

.PHONY: all build update clean
