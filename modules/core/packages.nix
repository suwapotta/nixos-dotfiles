{
  flake.nixosModules."packages" =
    { pkgs, ... }:

    # List of system packages
    {
      environment.systemPackages = with pkgs; [
        # gnumake
        just

        unzip

        wget
        curl
      ];
    };
}
