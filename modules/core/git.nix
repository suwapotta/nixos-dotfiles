{
  programs = {
    git = {
      enable = true;

      config = {
        user.name = "suwapotta";
        user.email = "nguyenducthientan@gmail.com";
        init.defaultBranch = "master";
      };
    };

    lazygit.enable = true;
  };
}
