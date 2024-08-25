{ lib, ... }:
{
  imports = [
    ./base.nix
    ./nvidia.nix
    ./user.nix
    ./graphical.nix
    ./docker.nix
    ./tailscale.nix
    ./virtualbox.nix
  ];

  options.sergiOS = with lib; {
    enable = mkEnableOption "sergiOS";
    hostname = mkOption {
      type = types.str;
    };
  };
}
