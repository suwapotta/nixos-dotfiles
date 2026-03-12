all:

laptop:
	git add .
	sudo nixos-rebuild switch --flake ./#laptop

vm:
	git add .
	sudo nixos-rebuild switch --flake ./#vm

test-laptop:
	git add .
	sudo nixos-rebuild test --flake ./#laptop

test-vm:
	git add .
	sudo nixos-rebuild test --flake ./#vm

# sandbox:
# 	git add .
# 	sudo nixos-rebuild build-vm --flake ./#laptop

update:
	nix flake update

clean:
	nix-collect-garbage -d

.PHONY: all laptop vm update clean
