{
  flake.homeModules."niri-flake" =
    {
      inputs,
      pkgs,
      ...
    }:

    {
      imports = [
        inputs.niri-flake.homeModules."niri"
      ];

      home = {
        sessionVariables = {
          NIXOS_OZONE_WL = 1;
        };

        packages = with pkgs; [
          nautilus
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
    };
}
