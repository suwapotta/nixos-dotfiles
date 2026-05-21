{
  pkgs,
  ...
}:

{
  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
  };

  users.users."vm-user" = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
    initialHashedPassword = "$y$j9T$qgB61P4hN.2sCf4gUbjH11$le712A/0qeCUyOICLBe7NxSfgNB4hslcpFkxNXHA4a7";
  };

  environment.systemPackages = with pkgs; [
    neovim
  ];

  system.stateVersion = "25.11";
}
