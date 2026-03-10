{ config, pkgs, ...}:

let
    dotfiles = "${config.home.homeDirectory}/nixos-dotfiles/configs";
    create_symlink = path: config.lib.file.mkOutOfStoreSymlink path;
    # Standard .config/ directories
    configs = {
	niri = "niri";
        kitty = "kitty";
	fish = "fish";
	fastfetch = "fastfetch";
	yazi = "yazi";
	"starship.toml" = "starship.toml"; 
    };
in

{
    home.username = "suwapotta";
    home.homeDirectory = "/home/suwapotta";
    home.stateVersion = "25.11";

    xdg.configFile = builtins.mapAttrs (name: subpath: { source = create_symlink "${dotfiles}/${subpath}";
    recursive = true; }) configs;
}
