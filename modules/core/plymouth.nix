{
  flake.nixosModules."plymouth" =
    { pkgs, ... }:

    {
      boot = {
        initrd = {
          kernelModules = [ "i915" ];
          verbose = false;
          systemd.enable = true;
        };

        kernelParams = [
          "quiet"
          "splash"
          "intremap=on"
          "boot.shell_on_fail"
          "udev.log_priority=3"
          "rd.systemd.show_status=auto"
        ];

        plymouth = {
          enable = true;
          font = "${pkgs.nerd-fonts.hack}/share/fonts/truetype/NerdFonts/HackNerdFont-Regular.ttf";
          logo = "${pkgs.nixos-icons}/share/icons/hicolor/256x256/apps/nix-snowflake.png";
        };
      };
    };
}
