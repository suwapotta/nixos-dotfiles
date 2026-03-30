{
  flake.homeModules."fastfetch" = {
    programs.fastfetch = {
      enable = true;

      # "$schema" = "https://github.com/fastfetch-cli/fastfetch/raw/dev/doc/json_schema.json";
      settings = {
        logo = {
          source = ../../../images/logos/nixos-flake.png;
          padding = {
            top = 2;
          };
        };

        display = {
          separator = "  ";
          constants = [
            "────────────────────────────────────────────────────────────"
          ];
        };

        modules = [
          "title"
          {
            type = "custom";
            format = "┌{$1}{$1}┐";
            outputColor = "90";
          }
          {
            type = "os";
            key = " OS";
            keyColor = "yellow";
            format = "{2}";
          }
          {
            type = "os";
            key = "├";
            keyColor = "yellow";
          }
          {
            type = "initsystem";
            key = "├";
            keyColor = "yellow";
          }
          {
            type = "kernel";
            key = "├";
            keyColor = "yellow";
          }
          {
            type = "packages";
            key = "├󰏖";
            keyColor = "yellow";
          }
          {
            type = "shell";
            key = "├";
            keyColor = "yellow";
          }
          {
            type = "command";
            key = "└󰔠";
            keyColor = "yellow";
            text = "birth_install=$(stat -c %W /); current=$(date +%s); time_progression=$((current - birth_install)); days_difference=$((time_progression / 86400)); echo $days_difference days";
          }
          "break"
          {
            type = "wm";
            key = " DE/WM";
            keyColor = "blue";
          }
          {
            type = "lm";
            key = "├󰧨";
            keyColor = "blue";
          }
          {
            type = "terminal";
            key = "└";
            keyColor = "blue";
          }
          "break"
          {
            type = "host";
            key = "󰌢 PC";
            keyColor = "green";
          }
          {
            type = "cpu";
            key = "├";
            keyColor = "green";
          }
          {
            type = "gpu";
            key = "├󰾲";
            keyColor = "green";
          }
          {
            type = "disk";
            key = "├";
            keyColor = "green";
          }
          {
            type = "memory";
            key = "├󰑭";
            keyColor = "green";
          }
          {
            type = "swap";
            key = "├󰓡";
            keyColor = "green";
          }
          {
            type = "display";
            key = "├󰍹";
            keyColor = "green";
          }
          {
            type = "uptime";
            key = "└󰅐";
            keyColor = "green";
          }
          "break"
          {
            type = "sound";
            key = " SND";
            keyColor = "cyan";
          }
          {
            type = "player";
            key = "├󰥠";
            keyColor = "cyan";
          }
          {
            type = "media";
            key = "└󰝚";
            keyColor = "cyan";
          }
          {
            type = "custom";
            format = "└{$1}{$1}┘";
            outputColor = "90";
          }
          "break"
          "colors"
          "break"
        ];
      };
    };
  };
}
