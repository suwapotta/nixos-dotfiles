{
  flake.nixosModules."git" = {
    programs.git = {
      enable = true;

      config = {
        user = {
          name = "suwapotta";
          email = "nguyenducthientan09@gmail.com";
        };

        init.defaultBranch = "master";
      };
    };
  };
}
