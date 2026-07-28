{ inputs, self, ... }: {
  flake.nixosModules.caddy = {
    config,
    lib,
    pkgs,
    ...
  }: let
    cfg = config.sergiOS;
  in {
    config = {
      services.caddy = {
        enable = true;
        package = pkgs.caddy.withPlugins {
          plugins = [ "github.com/caddy-dns/porkbun@v0.3.1" ];
          hash = "sha256-YZ4Bq0hfOJpa0C2lKipEY4fqwzJbEFM7ci5ys9S3uAo=";
        };
        virtualHosts."lab.sergiopb.dev".extraConfig = ''
          reverse_proxy http://legion:8080
        '';
      };
    };
  };
}
