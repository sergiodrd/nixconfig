{
  config,
  lib,
  inputs,
  pkgs,
  ...
}: let
  cfg = config.sergiOS;
in {
  options.sergiOS.caddy = with lib; {
    enable = mkEnableOption "caddy";
    allowLowPorts = mkOption {
      type = types.bool;
      default = true;
    };
    requiresSandboxDisabled = mkOption {
      type = types.bool;
      default = cfg.caddy.enable && cfg.caddy.allowLowPorts;
      internal = true;
    };
  };

  config = lib.mkIf cfg.caddy.enable {
    assertions = lib.mkIf cfg.caddy.allowLowPorts [
      {
        assertion = !config.nix.settings.sandbox;
        message = "Caddy with allowLowPorts=true requires nix.settings.sandbox = false.";
      }
    ];

    services.caddy = {
      enable = true;
      package = inputs.caddy-patched.packages.x86_64-linux.caddy;
      virtualHosts."lab.sergiopb.dev".extraConfig = ''
        respond "Hello, World!"
      '';
    };
  };
}
