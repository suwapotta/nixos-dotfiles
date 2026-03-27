{
  flake.homeModules."tealdeer" = {
    programs.tealdeer = {
      enable = true;

      settings = {
        style = {
          description = {
            underline = false;
            bold = true;
            italic = false;
          };

          command_name = {
            foreground = "blue";
            underline = false;
            bold = false;
            italic = false;
          };

          example_text = {
            foreground = "yellow";
            underline = false;
            bold = false;
            italic = false;
          };

          example_code = {
            foreground = "cyan";
            underline = false;
            bold = false;
            italic = false;
          };

          example_variable = {
            foreground = "cyan";
            underline = false;
            bold = false;
            italic = true;
          };
        };

        display = {
          compact = false;
          use_pager = false;
          show_title = true;
        };

        updates = {
          auto_update = true;
          auto_update_interval_hours = 720;
          archive_source = "https://github.com/tldr-pages/tldr/releases/latest/download/";
          tls_backend = "rustls-with-webpki-roots";
        };

        # directories = {
        #   cache_dir = "/home/myuser/.tealdeer-cache/";
        #   custom_pages_dir = "/home/myuser/custom-tldr-pages/";
        # };

        search = {
          languages = [ "en" ];

          platforms = [
            "linux"
            "freebsd"
            "all"
          ];
        };
      };
    };
  };
}
