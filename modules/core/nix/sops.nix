{
  lib,
  config,
  inputs,
  ...
}:

{
  options = {
    modules.core.nix.sops.enable = lib.mkEnableOption "atomic secrets management tool" // {
      default = true;
    };
  };

  imports = [
    inputs.sops-nix.nixosModules.sops
  ];

  config = lib.mkIf config.modules.core.nix.sops.enable {
    sops = {
      defaultSopsFile = ../../../secrets/system-level/password-hashes.yaml;
      defaultSopsFormat = "yaml";
      age.keyFile = "/root/.config/sops/age/keys.txt";

      secrets = {
        # ── password-hashes.yaml ───────────────────────────────────────────────────────
        "normal-user" = {
          # owner = "root";
          neededForUsers = true;
          sopsFile = ../../../secrets/system-level/password-hashes.yaml;
        };

        "vm-user" = {
          # owner = "root";
          neededForUsers = true;
          sopsFile = ../../../secrets/system-level/password-hashes.yaml;
        };
      };
    };
  };
}
