{
  flake.nixosModules."variables" = {
    environment = {
      # Override defaultEditor option
      variables = {
        EDITOR = "nvim";
        VISUAL = "nvim";
      };

      # fcitx5 variables
      sessionVariables = {
        XMODIFIERS = "@im=fcitx";
        MOZ_ENABLE_WAYLAND = "1";
        GLFW_IM_MODULE = "ibus";
      };
    };
  };
}
