{ pkgs, config, ... }:

{
  # ╔────────────────────────────────────────────────────────────╗
  # │.---..---.,-.  .---. .---..-. .-..-..-..-.  /. /..-..-..--. │
  # │| |'_| |- | /-.  -|| `| |'| |=| || || .` |  || ||| || || \ \│
  # │`-'-/`-'  `---'`---'  `-' `-' `-'`-'`-'`-'  -- --`----'`-'-'│
  # ╚────────────────────────────────────────────────────────────╝

  # NOTE: Specific settings for MSI-laptop
  environment.systemPackages = with pkgs; [ mcontrolcenter ];
  boot = {
    # Linux kernel
    kernelModules = [
      "msi-ec"
      "ec_sys"
    ];

    extraModulePackages = [ config.boot.kernelPackages.msi-ec ];

    # Keyboard
    kernelParams = [ "hid_apple.fnmode=2" ];
  };

  # WARN: DO NOT change the state version below no matter what!
  system.stateVersion = "25.11";
}
