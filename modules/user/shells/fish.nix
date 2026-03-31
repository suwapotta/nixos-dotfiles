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
          clear = "printf '\\033[2J\\033[3J\\033[1;1H'";
          ls = "eza --icons";
          ll = "eza --icons -lh";
          nix-make = "make -C ${config.home.homeDirectory}/nixos-dotfiles";
        };

        shellAbbrs = {
          lg = "lazygit";
          nlg = "sudo nix-env --list-generations --profile /nix/var/nix/profiles/system";
          noi = "nh os info";
          nr = "nh os repl -H laptop";
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
          y = mkFunction "y";
          yank_to_clipboard = mkFunction "yank_to_clipboard";
        };
      };
    };
}
