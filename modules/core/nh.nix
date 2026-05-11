{
  flake.nixosModules."nh" =
    let
      FLAKE_DIR = "/home/suwapotta/nixos-dotfiles/hosts/laptop";
    in
    {
      programs.nh = {
        enable = true;

        clean.enable = true;
        clean.extraArgs = "--keep-since 7d --keep 3";
        flake = "${FLAKE_DIR}"; # sets NH_OS_FLAKE variable
      };
    };
}
