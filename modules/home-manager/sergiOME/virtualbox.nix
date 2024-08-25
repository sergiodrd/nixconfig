{ config, lib, pkgs, ... }:
let
  cfg = config.sergiOME.virtualbox;
in
{
  options.sergiOME.virtualbox = with lib; {
    enable = mkEnableOption "virtualbox";
  };

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      virtualbox
    ];
  };
}
