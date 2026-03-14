{ lib, ... }:

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
    ssh.startAgent = true;
  };

  services.gnome.gcr-ssh-agent.enable = lib.mkForce false;
}
