{ lib, ... }:
{
  imports = [
    ./base.nix
    ./nvidia.nix
    ./user.nix
    ./graphical.nix
  ];

  options.sergiOS = with lib; {
    enable = mkEnableOption "sergiOS";
  };
}
