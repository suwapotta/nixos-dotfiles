{
  flake.nixosModules."packages" =
    { pkgs, ... }:

    # List packages installed in system profile
    {
      environment.systemPackages = with pkgs; [
        mcontrolcenter

        gnumake
        unzip

        wget
        curl
      ];
    };
}
