{
  lib,
  config,
  ...
}:

{
  options = {
    modules.user.terminals.alacritty.enable =
      lib.mkEnableOption "alacritty - lightweight gpu accelerated terminal emulator";
  };

  config = lib.mkIf config.modules.user.terminals.alacritty.enable {
    programs.alacritty = {
      enable = true;

      settings = {
        window.decorations = "None";
      };
    };
  };
}
