{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.sergiOS;
in {
  options.sergiOS.virtualbox = with lib; {
    enable = mkEnableOption "virtualbox";
  };

  config = lib.mkIf cfg.virtualbox.enable {
    environment.systemPackages = [pkgs.qemu];
    virtualisation.virtualbox.host.enable = true;
    users.extraGroups.vboxusers.members = [cfg.user];
  };
}
