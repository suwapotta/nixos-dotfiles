{
  inputs,
  pkgs,
  ...
}:

{
  imports = [
    inputs.niri-flake.homeModules.niri
  ];

  home = {
    sessionVariables = {
      NIRI_DISABLE_SYSTEM_MANAGER_NOTIFY = 1;
      NIXOS_OZONE_WL = 1;
    };

    packages = with pkgs; [
      xwayland-satellite
      wl-clipboard
      libsecret
    ];
  };

  programs.niri = {
    enable = true;

    package = pkgs.niri;
    # package = pkgs.niri-stable;
    # package = pkgs.niri-stable;
  };
}
