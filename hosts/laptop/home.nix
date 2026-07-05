{
  inputs,
  ...
}:

{
  imports = [
    # ── Modules ───────────────────────────────────────────────────────────────────
    ../../modules/user/user-default.nix
  ];

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    extraSpecialArgs = { inherit inputs; };
    backupFileExtension = "bak";

    users."suwapotta".home = {
      stateVersion = "25.11";
      username = "suwapotta";
      homeDirectory = "/home/suwapotta";
    };
  };
}
