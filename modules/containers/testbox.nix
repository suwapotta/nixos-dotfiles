{
  flake.nixosModules."testbox" =
    { pkgs, ... }:

    {
      containers."testbox" = {
        autoStart = false;
        privateNetwork = false;

        config = {
          environment = {
            systemPackages = with pkgs; [ neovim ];

            sessionVariables = {
              TERM = "xterm-256color";
            };
          };

          programs.nano.enable = false;

          system.stateVersion = "26.05";
        };
      };
    };
}
