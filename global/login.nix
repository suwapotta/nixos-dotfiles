{ _, ... }:

{
  programs.bash = {
    loginShellInit = builtins.readFile ../scripts/autoLogin.sh;

    # # programs.zoxide.enableBashIntergration
    # shellAliases = {
    #   ls = "eza --icons";
    #   ll = "eza --icons -lh";
    #   lg = "lazygit";
    # };
  };
}
