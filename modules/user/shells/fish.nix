{
  flake.nixosModules."fish" =
    let
      mkFunction = functionName: {
        body = builtins.readFile (../../../config/fish + "/${functionName}.fish");
      };
    in
    {
      catppuccin.fish.enable = true;

      programs.fish = {
        enable = true;

        shellAliases = {
          ls = "eza --icons";
          ll = "eza --icons -lh";
          lg = "lazygit";
          clear = "printf '\\033[2J\\033[3J\\033[1;1H'";
        };

        shellInit = ''
          set -gx MANPAGER 'nvim +Man!'
          set -gx LIBVA_DRIVER_NAME iHD
          set -gx EZA_COLORS "*.txt=35:*.md=35:*.kdl=33:*.sv=33"
        '';

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
          y = mkFunction "y";
          yank_to_clipboard = mkFunction "yank_to_clipboard";
        };
      };
    };
}
