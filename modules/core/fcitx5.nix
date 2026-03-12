{ pkgs, ... }:

{
  i18n.inputMethod = {
    enable = true;

    type = "fcitx5";
    fcitx5 = {
      waylandFrontend = true;
      ignoreUserConfig = true;

      addons = with pkgs; [
        kdePackages.fcitx5-unikey
        fcitx5-mozc
        kdePackages.fcitx5-qt
        fcitx5-gtk
        catppuccin-fcitx5
      ];

      settings = {
        inputMethod = {
          GroupOrder."0" = "Default";

          "Groups/0" = {
            Name = "Default";
            "Default Layout" = "us";
            DefaultIM = "unikey";
          };

          "Groups/0/Items/0" = {
            Name = "keyboard-us";
            Layout = "";
          };

          "Groups/0/Items/1" = {
            Name = "unikey";
            Layout = "";
          };

          "Groups/0/Items/2" = {
            Name = "mozc";
            Layout = "";
          };
        };
      };
    };
  };
}
