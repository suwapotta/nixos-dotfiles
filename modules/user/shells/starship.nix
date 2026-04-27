{
  flake.homeModules."starship" = {
    programs.starship = {
      enable = true;
      enableTransience = true;

      settings = {
        # Pipes ╰─ ╭─
        # Powerline symbols                                    
        # Wedges 🭧🭒 🭣🭧🭓
        # Random noise 🬖🬥🬔🬗
        # Cool stuff 󰜥    •
        add_newline = false;

        format = ''
          $username$hostname  $cmd_duration  $nix_shell$directory $git_branch
          $character
        '';
        # format = ''
        #   $cmd_duration 󰜥 $directory $git_branch
        #   $character
        # '';

        character = {
          success_symbol = "[   ](bold fg:blue)";
          error_symbol = "[   ](bold fg:red)";
          vimcmd_symbol = "[   ](bold fg:blue)";
          vimcmd_visual_symbol = "[   ](bold fg:blue)";
          vimcmd_replace_one_symbol = "[  󰛔 ](bold fg:blue)";
          vimcmd_replace_symbol = "[  󰬲 ](bold fg:blue)";
        };

        # Disable the package module, hiding it from the prompt completely
        package = {
          disabled = true;
        };

        git_branch = {
          style = "bg: cyan";
          symbol = "󰘬";
          truncation_length = 12;
          truncation_symbol = "";
          format = "󰜥 [](bold fg:cyan)[$symbol $branch(:$remote_branch)](fg:black bg:cyan)[ ](bold fg:cyan)";
        };

        git_commit = {
          commit_hash_length = 4;
          tag_symbol = " ";
        };

        git_state = {
          format = "[\\($state( $progress_current of $progress_total)\\)]($style) ";
          cherry_pick = "[🍒 PICKING](bold red)";
        };

        git_status = {
          conflicted = " 🏳 ";
          ahead = " 🏎💨 ";
          behind = " 😰 ";
          diverged = " 😵 ";
          untracked = " 🤷 ‍";
          stashed = " 📦 ";
          modified = " 📝 ";
          staged = "[++\\($count\\)](green)";
          renamed = " ✍️ ";
          deleted = " 🗑 ";
        };

        hostname = {
          ssh_only = false;
          format = "[ • $hostname](bg:purple bold fg:black)[](bold fg:purple)";
          trim_at = ".companyname.com";
        };

        line_break = {
          disabled = false;
        };

        memory_usage = {
          disabled = true;
          threshold = -1;
          symbol = " ";
          style = "bold dimmed green";
        };

        time = {
          disabled = true;
          format = "🕙[\\[ $time \\]]($style) ";
          time_format = "%T";
        };

        username = {
          style_user = "bold bg:cyan fg:black";
          style_root = "red bold";
          format = "[](bold fg:purple)[]($style)";
          disabled = false;
          show_always = true;
        };

        directory = {
          home_symbol = "  ";
          read_only = "  ";
          style = "bg:green fg:black";
          truncation_length = 2;
          truncation_symbol = " ••/";
          format = "[](bold fg:green)[󰉋 $path]($style)[](bold fg:green)";

          substitutions = {
            ".config" = "  ";
            "Desktop" = "  ";
            "Documents" = "  ";
            "Downloads" = "  ";
            "Music" = " 󰎈 ";
            "Pictures" = "  ";
            "Videos" = "  ";
            "GitHub" = " 󰊤 ";
            "Workspace" = "  ";
            "nixos-dotfiles" = "  ";
            "Virtualisation" = " 󰗮 ";
          };
        };

        cmd_duration = {
          min_time = 0;
          format = "[](bold fg:yellow)[󰪢 $duration](bold bg:yellow fg:black)[](bold fg:yellow)";
        };

        nix_shell = {
          format = "[](bold fg:blue)[ $name](bg:blue fg:black)[](bold fg:blue)  ";
        };
      };
    };
  };
}
