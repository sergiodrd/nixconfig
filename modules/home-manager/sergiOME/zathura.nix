{ config, lib, pkgs, ... }:
let
  cfg = config.sergiOME.zathura;
in
{
  options.sergiOME.zathura = with lib; {
    enable = mkEnableOption "zathura";
  };

  config.programs.zathura = lib.mkIf cfg.enable {
    enable = true;
  };
}
