{
  lib,
  config,
  ...
}:

let
  cfg = config.modules.core.users;
in
{
  options = {
    modules.core.users = {
      enable = lib.mkEnableOption "users declaration";
      remoteBuilder = lib.mkEnableOption "dedicated nix-builder user for remote compilation";
    };
  };

  config = lib.mkIf cfg.enable {
    users.users = lib.mkMerge [
      # ── Global ────────────────────────────────────────────────────────────────────
      {
        "suwapotta" = {
          isNormalUser = true;
          extraGroups = [
            "wheel"
            "networkmanager"
          ];
        };
      }

      # ── Remote Builder ────────────────────────────────────────────────────────────
      (lib.mkIf cfg.remoteBuilder {
        "nix-builder" = {
          isNormalUser = true;
          homeMode = "0500";

          openssh.authorizedKeys.keys = [
            "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIHigXCbKjYynsaIMyBA1gOT8mEOql0ZmnPItY076rb9V remote_build"
          ];
        };
      })
    ];
  };
}
