{
  lib,
  config,
  ...
}:

{
  options = {
    modules.core.nix.vm-variant.enable = lib.mkEnableOption "basic vm";
  };

  config = lib.mkIf config.modules.core.nix.vm-variant.enable {
    virtualisation.vmVariant = {
      users.extraUsers."vm-user" = {
        isNormalUser = true;

        extraGroups = [ "wheel" ];
        initialHashedPassword = "$y$j9T$DGgyvod9oxdgR0hFqbJlZ.$lX0jcBgJlHVmxxFWPo1yStGcE1H9RosrlQF.HgeIua1";
      };
    };
  };
}
