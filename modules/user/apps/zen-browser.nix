{
  flake.homeModules."zen-browser" =
    { inputs, pkgs, ... }:

    {
      home.sessionVariables.BROWSER = "zen-beta";

      imports = [
        inputs.zen-browser.homeModules.beta
      ];

      programs.zen-browser = {
        enable = true;
        setAsDefaultBrowser = true;

        policies = {
          DisableTelemetry = true;
          DisableFirefoxStudies = true;
          NetworkPrediction = false;
          HttpsOnlyMode = "force_enabled";
          DNSOverHTTPS = {
            Enabled = true;
            Locked = true;
          };
          EnableTrackingProtection = {
            Value = true;
            Locked = true;
            Cryptomining = true;
            Fingerprinting = true;
          };

          AutofillAddressEnabled = true;
          AutofillCreditCardEnabled = false;
          OfferToSaveLogins = false;

          DisablePocket = true;
          DisableFirefoxAccounts = true;
          DisableFeedbackCommands = true;
          DisableSetDesktopBackground = true;
          UserMessaging = {
            ExtensionRecommendations = false;
            FeatureRecommendations = false;
            UrlbarInterventions = false;
            SkipOnboarding = true;
            WhatsNew = false;
          };

          DisableAppUpdate = true;
          DisableSystemAddonUpdate = true;
          DontCheckDefaultBrowser = true;
        };

        profiles.default =
          let
            containers = {
              Personal = {
                color = "purple";
                icon = "fingerprint";
                id = 1;
              };

              Study = {
                color = "blue";
                icon = "briefcase";
                id = 2;
              };

              Nix = {
                color = "turquoise";
                icon = "circle";
                id = 3;
              };
            };

            spaces = {
              "Space" = {
                id = "caa434f6-8f95-4ac7-be50-f27197141f30";
                position = 1000;
              };
              "Study" = {
                id = "827c0ad8-339b-4212-be4e-ae2ce5822c32";
                icon = "🎓";
                container = containers.Study.id;
                position = 2000;
              };
              "Nix" = {
                id = "0778051e-e3d3-4c57-8fc9-f710ca78af94";
                icon = "❄️";
                container = containers.Nix.id;
                position = 3000;
              };
            };

            pins = {
              "NixOS-Dotfiles" = {
                id = "ececd77f-1354-4c4b-931e-fdca3754cdeb";
                url = "https://github.com/suwapotta/nixos-dotfiles";
                isEssential = true;
                position = 101;
              };
              "YouTube" = {
                id = "4cb898b1-2137-4c5b-8ffb-99c8dde3b777";
                url = "https://www.youtube.com/";
                isEssential = true;
                position = 102;
              };
              "Messenger" = {
                id = "47bf06cc-8702-43e5-9b0e-d8ae6c376b33";
                url = "https://www.messenger.com/t/5765709533478160/";
                isEssential = true;
                position = 103;
              };
              "FreeBSD Manual" = {
                id = "c95d3575-555a-4f2d-b860-0e0b999d10e4";
                url = "https://docs.freebsd.org/en/books/handbook/introduction/";
                isEssential = true;
                position = 201;
              };
              "LFS" = {
                id = "626f7fc7-4b14-4d3d-a3b4-fe3e2b4c860a";
                url = "https://www.linuxfromscratch.org/";
                isEssential = true;
                position = 202;
              };
              "NixDev" = {
                id = "bc2939f7-40e0-46d3-8859-1cdb1c1d1dc2";
                url = "https://nix.dev/tutorials/nix-language";
                isEssential = true;
                position = 203;
              };
            };
          in
          {
            containersForce = true;
            spacesForce = true;
            pinsForce = true;
            inherit containers spaces pins;

            extensions.packages = with inputs.firefox-addons.packages.${pkgs.stdenv.hostPlatform.system}; [
              ublock-origin
              darkreader
              vimium
              yomitan
              youtube-nonstop
            ];

            search = {
              force = true;
              default = "ddg";
              engines = {
                "NixOS packages" = {
                  urls = [ { template = "https://search.nixos.org/packages?channel=unstable&query={searchTerms}"; } ];
                  icon = "https://wiki.nixos.org/favicon.ico";
                  definedAliases = [ "@packages" ];
                };
                "NixOS options" = {
                  urls = [ { template = "https://search.nixos.org/options?channel=unstable&query={searchTerms}"; } ];
                  icon = "https://wiki.nixos.org/favicon.ico";
                  definedAliases = [ "@options" ];
                };
                "NixOS Wiki" = {
                  urls = [ { template = "https://wiki.nixos.org/w/index.php?search={searchTerms}"; } ];
                  icon = "https://wiki.nixos.org/favicon.ico";
                  definedAliases = [ "@wiki" ];
                };
                "Arch Wiki" = {
                  urls = [ { template = "https://wiki.archlinux.org/index.php?search={searchTerms}"; } ];
                  icon = "https://wiki.archlinux.org/favicon.ico";
                  definedAliases = [ "@archwiki" ];
                };
                "YouTube Search" = {
                  urls = [ { template = "https://www.youtube.com/results?search_query={searchTerms}"; } ];
                  icon = "https://www.youtube.com/favicon.ico";
                  definedAliases = [ "@youtube" ];
                };
                "My NixOS" = {
                  urls = [ { template = "https://mynixos.com/search?q={searchTerms}"; } ];
                  icon = "https://mynixos.com/favicon.ico";
                  definedAliases = [ "@mynixos" ];
                };

                "wikipedia".metaData.hidden = true;
                "bing".metaData.hidden = true;
              };
            };

            settings = {
              "extensions.autoDisableScopes" = 0;
              "extensions.pocket.enabled" = false;
              "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
              "font.default.x-western" = "sans-serif";
              "font.name.serif.x-western" = "Work Sans";
              "font.name.sans-serif.x-western" = "Work Sans";
              "font.name.monospace.x-western" = "JetBrainsMono Nerd Font";
              "browser.contentblocking.category" = "strict";
              "signon.rememberSignons" = false;
              "zen.urlbar.behavior" = "float";
              "browser.ctrlTab.sortByRecentlyUsed" = true;
              "general.autoScroll" = true;
            };

            bookmarks = {
              force = true;
              settings = [
                {
                  name = "Bookmarks Toolbar";
                  toolbar = true;
                  bookmarks = [
                    {
                      name = "Arch Linux";
                      url = "https://archlinux.org/";
                    }
                    {
                      name = "Google";
                      url = "https://www.google.com/";
                    }
                    {
                      name = "Messenger";
                      url = "https://www.messenger.com/t/5765709533478160/";
                    }
                    {
                      name = "YouTube";
                      url = "https://www.youtube.com/";
                    }
                    {
                      name = "Gmail";
                      url = "https://mail.google.com/mail/u/0/?ogbl#inbox";
                    }
                    {
                      name = "BK-LMS";
                      url = "https://lms.hcmut.edu.vn/my/";
                    }
                    {
                      name = "My Bach Khoa";
                      url = "https://mybk.hcmut.edu.vn/my/index.action";
                    }
                    {
                      name = "Academic Affairs Office";
                      url = "https://mybk.hcmut.edu.vn/app/";
                    }
                    {
                      name = "Google Calender";
                      url = "https://calendar.google.com/calendar/u/1/r";
                    }
                    {
                      name = "Google Gemini";
                      url = "https://gemini.google.com/app";
                    }
                    {
                      name = "Tinkercad";
                      url = "https://www.tinkercad.com/dashboard/designs/circuits";
                    }
                    {
                      name = "アニメ";
                      url = "https://aanime.biz/";
                    }
                    {
                      name = "GitHub";
                      url = "https://github.com/";
                    }
                    {
                      name = "HCMUT Coursewave";
                      url = "https://github.com/";
                    }
                    {
                      name = "Zalo";
                      url = "https://chat.zalo.me/";
                    }
                    {
                      name = "LFS News";
                      url = "https://www.linuxfromscratch.org/lfs/news.html";
                    }
                  ];
                }
              ];
            };
          };
      };
    };
}
