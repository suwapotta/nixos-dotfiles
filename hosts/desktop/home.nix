{
  inputs,
  hostList,
  hostName,
  hosts,
  stateVersion,
  userEmail,
  userName,
  ...
}:

{
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    extraSpecialArgs = {
      inherit
        inputs
        hostList
        hostName
        hosts
        stateVersion
        userEmail
        userName
        ;
    };
    backupFileExtension = "bak";
    sharedModules = [
      # ── sops-nix ──────────────────────────────────────────────────────────────────
      inputs.sops-nix.homeManagerModules.sops

      # ── Modules ───────────────────────────────────────────────────────────────────
      ../../modules/user/user-default.nix
    ];

    users."${userName}" = {
      imports = [
        ./user-configuration.nix
      ];

      home = {
        inherit stateVersion;
        username = "${userName}";
        homeDirectory = "/home/${userName}";
      };

      sops = {
        defaultSopsFile = ../../secrets/user-level/ssh-keys.yaml;
        defaultSopsFormat = "yaml";
        age.keyFile = "/home/${userName}/.config/sops/age/keys.txt";
      };
    };
  };
}
