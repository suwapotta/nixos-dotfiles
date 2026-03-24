{
  flake.nixosModules."git" = {
    programs = {
      git = {
        enable = true;

        config = {
          user.name = "suwapotta";
          user.email = "nguyenducthientan09@gmail.com";

          init.defaultBranch = "master";
        };
      };
    };
  };
}
