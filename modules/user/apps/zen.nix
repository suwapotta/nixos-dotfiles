{
  inputs,
  pkgs,
  lib,
  ...
}:
let
  extension = shortId: guid: {
    name = guid;
    value = {
      install_url = "https://addons.mozilla.org/en-US/firefox/downloads/latest/${shortId}/latest.xpi";
      installation_mode = "normal_installed";
    };
  };

  prefs = {
    # Check these out at about:config
    "extensions.autoDisableScopes" = 0;
    "extensions.pocket.enabled" = false;
    "toolkit.legacyUserProfileCustomizations.stylesheets" = true;

    "font.default.x-western" = "sans-serif";
    "font.name.serif.x-western" = "Inter";
    "font.name.sans-serif.x-western" = "Inter";
    "font.name.monospace.x-western" = "JetBrainsMono Nerd Font";

    "browser.contentblocking.category" = "strict";
    "signon.rememberSignons" = false;
  };

  extensions = [
    # To add additional extensions, find it on addons.mozilla.org, find
    # the short ID in the url (like https://addons.mozilla.org/en-US/firefox/addon/!SHORT_ID!/)
    # Then go to https://addons.mozilla.org/api/v5/addons/addon/!SHORT_ID!/ to get the guid
    (extension "ublock-origin" "uBlock0@raymondhill.net")
    (extension "darkreader" "addon@darkreader.org")
    (extension "vimium-ff" "{d7742d87-e61d-4b78-b8a1-b469842139fa}")
    (extension "yomitan" "{6b733b82-9261-47ee-a595-2dda294a4d08}")
    (extension "youtube-nonstop" "{0d7cafdd-501c-49ca-8ebb-e3341caaa55e}")
  ];
in

{
  home.packages = [
    (pkgs.wrapFirefox
      inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.zen-browser-unwrapped
      {
        extraPrefs = lib.concatLines (
          lib.mapAttrsToList (
            name: value: "lockPref(${lib.strings.toJSON name}, ${lib.strings.toJSON value});"
          ) prefs
        );

        extraPolicies = {
          DisableTelemetry = true;
          DisableFirefoxAccount = false;
          OfferToSaveLogins = false;
          ExtensionSettings = builtins.listToAttrs extensions;

          SearchEngines = {
            Default = "google";

            Add = [
              {
                Name = "nixpkgs packages";
                URLTemplate = "https://search.nixos.org/packages?channel=unstable&query={searchTerms}";
                IconURL = "https://wiki.nixos.org/favicon.ico";
                Alias = "@np";
              }
              {
                Name = "NixOS options";
                URLTemplate = "https://search.nixos.org/options?channel=unstable&query={searchTerms}";
                IconURL = "https://wiki.nixos.org/favicon.ico";
                Alias = "@no";
              }
              {
                Name = "NixOS Wiki";
                URLTemplate = "https://wiki.nixos.org/w/index.php?search={searchTerms}";
                IconURL = "https://wiki.nixos.org/favicon.ico";
                Alias = "@nw";
              }
              {
                Name = "Arch Wiki";
                URLTemplate = "https://wiki.archlinux.org/index.php?search={searchTerms}";
                IconURL = "https://wiki.archlinux.org/favicon.ico";
                Alias = "@aw";
              }
              {
                Name = "Youtube";
                URLTemplate = "https://www.youtube.com/results?search_query={searchTerms}";
                IconURL = "https://www.youtube.com/favicon.ico";
                Alias = "@yt";
              }
            ];
          };
        };
      }
    )
  ];
}
