{
  programs.nh = {
    enable = true;

    clean.enable = true;
    clean.extraArgs = "--keep-since 7d --keep 3";
    flake = "/home/suwapotta/nixos-dotfiles/"; # sets NH_OS_FLAKE variable
  };
}
