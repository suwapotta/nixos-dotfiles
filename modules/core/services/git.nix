{
  lib,
  config,
  userName,
  userEmail,
  ...
}:

{
  options = {
    modules.core.services.git.enable = lib.mkEnableOption "git options";
  };

  config = lib.mkIf config.modules.core.services.git.enable {
    programs.git = {
      enable = true;

      config = {
        user = {
          name = userName;
          email = userEmail;
        };

        init.defaultBranch = "master";
      };
    };
  };
}
