{
  config,
  lib,
  pkgs,
  inputs,
  ...
}: let
  cfg = config.sergiOS.sops;
in {
  imports = [
    inputs.sops-nix.nixosModules.sops
  ];

  options.sergiOS.sops = with lib; {
    enable = mkEnableOption "sops";
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [ sops age ];

    sops.defaultSopsFile = ../../../secrets.yaml;
    sops.defaultSopsFormat = "yaml";

    sops.age.keyFile = "/home/sergio/.config/sops/age/keys.txt";

    sops.secrets."container_tailscale_keys/glance" = {};
  };
}
