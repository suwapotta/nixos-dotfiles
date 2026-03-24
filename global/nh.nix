let
  HOME = "/home/suwapotta";
in
{
  programs.nh = {
    enable = true;

    clean.enable = true;
    clean.extraArgs = "--keep-since 7d --keep 3";
    flake = "${HOME}"; # sets NH_OS_FLAKE variable
  };
}
