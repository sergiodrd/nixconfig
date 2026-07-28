{ inputs, self, ... }: {
  flake.nixosModules.sops = {
    config,
    lib,
    pkgs,
    ...
  }: let
    cfg = config.sergiOS.sops;
  in {
    imports = [
      inputs.sops-nix.nixosModules.sops
    ];

    config = {
      environment.systemPackages = with pkgs; [ sops age ];

      sops.defaultSopsFile = ../../secrets.yaml;
      sops.defaultSopsFormat = "yaml";

      sops.age.keyFile = "/home/sergio/.config/sops/age/keys.txt";

      sops.secrets."container_tailscale_keys/glance" = {};
    };
  };
}
