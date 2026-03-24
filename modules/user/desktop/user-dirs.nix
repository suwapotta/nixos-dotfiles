{
  flake.nixosModules."user-dirs" =
    { config, ... }:

    with config.home;
    let
      folders = {
        music = "Music";
        videos = "Videos";
        desktop = "Desktop";
        download = "Downloads";
        pictures = "Pictures";
        documents = "Documents";
        templates = "Templates";
        publicShare = "Public";
      };

      mkDir = name: "${homeDirectory}/${name}";
    in
    {
      xdg.userDirs = {
        enable = true;
        createDirectories = true;
        setSessionVariables = false;

        extraConfig = {
          WORKSPACE = mkDir "Workspace";
          VIRTUALISATION = mkDir "Virtualisation";
        };
      }
      // builtins.mapAttrs (name: folder: "${homeDirectory}/${folder}") folders;
    };
}
