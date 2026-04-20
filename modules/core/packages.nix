{
  flake.nixosModules."packages" =
    { pkgs, ... }:

    # List packages installed in system profile
    {
      environment.systemPackages = with pkgs; [
        mcontrolcenter

        gcc
        gnumake
        unzip

        wget
        curl
      ];
    };
}
