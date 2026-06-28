{
  flake.homeModules."qt" =
    {
      lib,
      config,
      ...
    }:

    let
      sharedInterface = {
        activate_item_on_single_click = 1;
        buttonbox_layout = 0;
        cursor_flash_time = 1000;
        dialog_buttons_have_icons = 1;
        double_click_interval = 400;
        gui_effects = "@Invalid()";
        keyboard_scheme = 2;
        menus_have_icons = true;
        show_shortcuts_in_context_menus = true;
        stylesheets = "@Invalid()";
        toolbutton_style = 4;
        underline_shortcut = 1;
        wheel_scroll_lines = 3;
      };

      sharedTroubleshooting = {
        force_raster_widgets = 1;
        ignored_applications = "@Invalid()";
      };
    in
    {
      qt = {
        enable = true;
        platformTheme.name = lib.mkForce "qtct";

        # ── QT5 ───────────────────────────────────────────────────────────────────────
        qt5ctSettings = {
          Appearance = {
            color_scheme_path = "${config.xdg.configHome}/qt5ct/colors/noctalia.conf";
            custom_palette = true;
            standard_dialogs = "default";
            style = "Fusion";
          };

          Fonts = {
            fixed = ''"DejaVu Sans,12,-1,5,50,0,0,0,0,0"'';
            general = ''"DejaVu Sans,12,-1,5,50,0,0,0,0,0"'';
          };

          Interface = sharedInterface;

          SettingsWindow = {
            geometry = ''@ByteArray(\x1\xd9\xd0\xcb\0\x3\0\0\0\0\0\0\0\0\0\0\0\0\x3\xaa\0\0\x3\xaa\0\0\0\0\0\0\0\0\0\0\x3\xaa\0\0\x3\xaa\0\0\0\0\0\0\0\0\a\x80\0\0\0\0\0\0\0\0\0\0\x3\xaa\0\0\x3\xaa)'';
          };

          Troubleshooting = sharedTroubleshooting;
        };

        # ── QT6 ───────────────────────────────────────────────────────────────────────
        qt6ctSettings = {
          Appearance = {
            color_scheme_path = "${config.xdg.configHome}/qt6ct/colors/noctalia.conf";
            custom_palette = true;
            icon_theme = "Adwaita";
            standard_dialogs = "default";
            style = "Fusion";
          };

          Fonts = {
            fixed = ''"Work Sans,9,-1,5,400,0,0,0,0,0,0,0,0,0,0,1,Regular"'';
            general = ''"Work Sans,9,-1,5,400,0,0,0,0,0,0,0,0,0,0,1,Regular"'';
          };

          Interface = sharedInterface;

          SettingsWindow = {
            geometry = ''@ByteArray(\x1\xd9\xd0\xcb\0\x3\0\0\0\0\0\0\0\0\0\0\0\0\x3\xaa\0\0\x3\xfe\0\0\0\0\0\0\0\0\0\0\x3\xaa\0\0\x3\xfe\0\0\0\0\0\0\0\0\a\x80\0\0\0\0\0\0\0\0\0\0\x3\xaa\0\0\x3\xfe)'';
          };

          Troubleshooting = sharedTroubleshooting;
        };
      };
    };
}
