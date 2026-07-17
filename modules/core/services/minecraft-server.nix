{
  lib,
  config,
  ...
}:

{
  options = {
    modules.core.services.minecraft-server.enable =
      lib.mkEnableOption "nixos native hosting server for minecraft";
  };

  config = lib.mkIf config.modules.core.services.minecraft-server.enable {
    services.minecraft-server = {
      enable = true;
      eula = true;
      openFirewall = true;
      declarative = true;

      serverProperties = {
        server-port = 45000;
        difficulty = 3; # Hard
        max-players = 3;
        motd = "NixOS Minecraft server!";
        allow-cheats = true;
        online-mode = false;
      };
      jvmOpts = "-Xms2048M -Xmx2048M";
    };

    modules.core.system._unfree-pkgs.list = [
      "minecraft-server"
    ];
  };
}
