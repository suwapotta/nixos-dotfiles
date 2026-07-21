{
  lib,
  config,
  ...
}:

let
  dotfiles = "${config.home.homeDirectory}/nixos-dotfiles/modules/user/dotfiles/config";
  dirContents = builtins.readDir ./config;
  dotfilesList = builtins.filter (name: dirContents.${name} == "directory") (
    builtins.attrNames dirContents
  );

  isNeovim = name: lib.hasSuffix "vim" name && (name != "vim");
  neovimDotfilesCount = lib.lists.count isNeovim cfg.targets;

  cfg = config.modules.user.dotfiles.symlink;
in
{
  options = {
    modules.user.dotfiles.symlink = {
      enable = lib.mkEnableOption "enables Out-Of-Store-Symlink";
      targets = lib.mkOption {
        type = lib.types.listOf (lib.types.enum dotfilesList);
        default = [ ];
      };
    };
  };

  config = lib.mkIf cfg.enable {
    assertions = [
      {
        assertion = neovimDotfilesCount <= 1;
        message = /* str */ ''
          Conflicting neovim for Out-Of-Store-Symlinking (${toString neovimDotfilesCount})
          Recheck targets passed into symlink.nix
        '';
      }
    ];

    # NOTE: Target standard ~/.config directories
    # Interates to make-out-of-store symlink from existing dotfiles
    xdg.configFile = builtins.listToAttrs (
      map (
        name:
        let
          targetDir = if isNeovim name then "nvim" else name;
        in
        {
          name = targetDir;
          value = {
            source = config.lib.file.mkOutOfStoreSymlink "${dotfiles}/${name}";
            recursive = true;
          };
        }
      ) cfg.targets
    );
  };
}
