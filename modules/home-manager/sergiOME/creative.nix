{
  config,
  inputs,
  lib,
  pkgs,
  ...
}: let
  cfg = config.sergiOME.creative;
in {
  options.sergiOME.creative = with lib; {
    enable = mkEnableOption "creative";
    gimp = {
      enable = mkEnableOption "gimp";
    };
    krita = {
      enable = mkEnableOption "krita";
    };
    davinci-resolve = {
      enable = mkEnableOption "krita";
    };
  };

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      gimp
      krita
      dolphin-emu
    ];
  };
}
