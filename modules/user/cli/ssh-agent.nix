{
  lib,
  config,
  ...
}:

let
  cfg = config.modules.user.cli.ssh-agent;
in
{
  options.modules.user.cli.ssh-agent = {
    enable = lib.mkEnableOption "ssh-agent background service";

    useTPM = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = "TPM 2.0 backed ssh-agent (ssh-tpm-agent)";
    };

    identityLifetimeSeconds = lib.mkOption {
      type = lib.types.ints.positive;
      default = 3600;
      description = "maximum time the agent will cache decrypted keys in memory (e.g., '1h', '30m').";
    };
  };

  config = lib.mkIf cfg.enable {

    # ── Standard Software SSH Agent ───────────────────────────────────────────────
    services.ssh-agent = lib.mkIf (!cfg.useTPM) {
      enable = true;
      defaultMaximumIdentityLifetime = cfg.identityLifetimeSeconds;
      # pkcs11Whitelist = "${pkcs.opensc}/lib/opensc-pkcs11.so";
    };

    # ── Hardware TPM 2.0 SSH Agent ────────────────────────────────────────────────
    services.ssh-tpm-agent = lib.mkIf cfg.useTPM {
      enable = true;
    };
  };
}
