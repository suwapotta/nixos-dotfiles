{
  inputs,
  ...
}:

{
  # ╔────────────────────────────────────────────────────────────╗
  # │.---..---.,-.  .---. .---..-. .-..-..-..-.  /. /..-..-..--. │
  # │| |'_| |- | /-.  -|| `| |'| |=| || || .` |  || ||| || || \ \│
  # │`-'-/`-'  `---'`---'  `-' `-' `-'`-'`-'`-'  -- --`----'`-'-'│
  # ╚────────────────────────────────────────────────────────────╝

  # WARN: DO NOT change the state version!
  system.stateVersion = "25.11";

  imports = [
    # ── Hardware ──────────────────────────────────────────────────────────────────
    ./hardware-configuration.nix

    # ── Disko ─────────────────────────────────────────────────────────────────────
    # inputs.disko.nixosModules.disko
    # ./disk-config.nix

    # ── Home Manager ──────────────────────────────────────────────────────────────
    inputs.home-manager.nixosModules.home-manager
    ./home.nix

    # ── Modules ───────────────────────────────────────────────────────────────────
    ../../modules/core/core-default.nix
    ../../modules/containers/containers-default.nix
    ../../modules/flake-utils/flakeutils-default.nix
    ../../modules/specialisation/specialisation-default.nix
  ];
}
