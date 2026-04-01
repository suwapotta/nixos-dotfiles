{
  flake.homeModules."fish" =
    { config, ... }:
    let
      mkFunction = functionName: {
        body = builtins.readFile (../../../config/fish + "/${functionName}.fish");
      };
    in
    {
      catppuccin.fish.enable = true;

      home.sessionVariables = {
        MANPAGER = "nvim +Man!";
        LIBVA_DRIVER_NAME = "iHD";
        EZA_COLORS = "*.txt=35:*.md=35:*.kdl=33:*.sv=33";
      };

      programs.fish = {
        enable = true;

        shellAliases = {
          nix-make = "make -C ${config.home.homeDirectory}/nixos-dotfiles";
          clear = "printf '\\033[2J\\033[3J\\033[1;1H'";
          ll = "eza --icons -lh";
          ls = "eza --icons";
        };

        shellAbbrs = {
          lg = "lazygit";
          nr = "nix repl";
          ni = "nix-instantiate";
          nie = "nix-instantiate --eval";
          nies = "nix-instantiate --eval --strict";
          nlg = "sudo nix-env --list-generations --profile /nix/var/nix/profiles/system";
          nsp = "nix-shell -p";
          noi = "nh os info";
          nrf = "nh os repl -H laptop";
          ns = "nh search";
          nca = "nh clean all --keep 3";
        };

        # shellInit = ''
        # '';

        interactiveShellInit = ''
          # No greeting
          set -g fish_greeting

          # sudo prompt
          set -gx SUDO_PROMPT (set_color -u -o red)"[sudo]"(set_color -u cyan) "Enter password %p:  "(set_color normal)

          # tmux + starship integration
          if not set -q TMUX
            if test -f ~/.local/state/quickshell/user/generated/terminal/sequences.txt
              cat ~/.local/state/quickshell/user/generated/terminal/sequences.txt
            end
          end
        '';

        functions = {
          bind_bang = mkFunction "bind_bang";
          bind_dollar = mkFunction "bind_dollar";
          starship_transient_prompt_func = mkFunction "starship_transient_prompt_func";
          fish_user_key_bindings = mkFunction "fish_user_key_bindings";
          yank_to_clipboard = mkFunction "yank_to_clipboard";
        };
      };
    };
}
