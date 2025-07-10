{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.sergiOS;
in {
  options.sergiOS.glance = with lib; {
    enable = mkEnableOption "glance";
  };

  config = lib.mkIf cfg.glance.enable {
    containers.glance = {
      autoStart = true;

      config = { ... }: {
        fileSystems."/etc/glance/tailscale-authkey" = {
          device = "/run/secrets/container_tailscale_keys/glance";
          options = [ "bind" "ro" ];
        };

        services.tailscale = {
          enable = true;
          authKeyFile = "/etc/glance/tailscale-authkey";
        };

        services.glance = {
          enable = true;
          settings = {
            server = {
              host = "0.0.0.0";
              port = 8080;
            };

            pages = [
              {
                name = "Home";
                columns = [
                  {
                    size = "small";
                    widgets = [
                      {
                        type = "releases";
                        cache = "1d";
                        repositories = [
                          "NixOS/nixpkgs"
                          "gleam-lang/gleam"
                          "openai/openai-cookbook"
                        ];
                      }
                    ];
                  }

                  {
                    size = "full";
                    widgets = [
                      {
                        type = "rss";
                        title = "Tech / Dev Feeds";
                        limit = 10;
                        collapse-after = 3;
                        cache = "6h";
                        feeds = [
                          { url = "https://www.joshwcomeau.com/rss.xml"; title = "Josh Comeau"; }
                          { url = "https://samwho.dev/rss.xml"; }
                          { url = "https://overreacted.io/rss.xml"; title = "Overreacted"; }
                          { url = "https://martinfowler.com/feed.atom"; title = "Martin Fowler"; }
                          { url = "https://blog.burntsushi.net/index.xml"; title = "Burnt Sushi"; }
                        ];
                      }

                      {
                        type = "rss";
                        title = "PL / Theory / HoTT";
                        limit = 10;
                        collapse-after = 3;
                        cache = "6h";
                        feeds = [
                          { url = "https://ciechanow.ski/atom.xml"; }
                          { url = "https://existentialtype.wordpress.com/feed/"; title = "Existential Type"; }
                          { url = "https://ncatlab.org/nlab/rss"; title = "nLab"; }
                          { url = "https://golem.ph.utexas.edu/category/atom10.xml"; title = "The n-Category Café"; }
                        ];
                      }

                      {
                        type = "videos";
                        channels = [
                          "UCm9vP4a6yN6i3x9klq7h_5A" # Dungeon Dudes
                          "UCkVdb9Yr8fc05_VbAVfskCA" # Web DM
                          "UCRp6tTdb3mXLsTgXlzVz68w" # Taking20
                        ];
                        title = "TTRPG / DM Theory";
                      }

                      { type = "hacker-news"; }
                      { type = "lobsters"; }
                    ];
                  }

                  {
                    size = "small";
                    widgets = [
                      {
                        type = "reddit";
                        subreddit = "behindthescreen";
                        title = "DM Advice";
                        show-thumbnails = false;
                      }

                      {
                        type = "reddit";
                        subreddit = "selfhosted";
                        show-thumbnails = true;
                      }

                      {
                        type = "rss";
                        title = "Campaign Blogs";
                        limit = 5;
                        cache = "12h";
                        feeds = [
                          { url = "https://thealexandrian.net/feed"; title = "The Alexandrian"; }
                          { url = "https://slyflourish.com/feeds/main.rss"; title = "Sly Flourish"; }
                        ];
                      }
                    ];
                  }
                ];
              }
            ];
          };
        };
      };
    };
  };
}
