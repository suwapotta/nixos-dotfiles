{
  lib,
  config,
  ...
}:

{
  options = {
    modules.core.system._unfree-pkgs.list = lib.mkOption {
      type = lib.types.listOf lib.types.str;
      default = [ ];
      description = "central whitelist of unfree software";
    };
  };

  config = {
    nixpkgs.config.allowUnfreePredicate =
      pkg: builtins.elem (lib.getName pkg) config.modules.core.system._unfree-pkgs.list;
  };
}
