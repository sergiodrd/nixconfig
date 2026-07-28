{ inputs, self, ... }: {
  flake.nixosModules.virtualbox = {
    config,
    lib,
    pkgs,
    ...
  }: let
    cfg = config.sergiOS;
  in {
    config = {
      environment.systemPackages = [pkgs.qemu];
      virtualisation.virtualbox.host.enable = true;
      users.extraGroups.vboxusers.members = [cfg.user];
    };
  };
}
