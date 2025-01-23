{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.sergiOME.typst;
in {
  options.sergiOME.typst = with lib; {
    enable = mkEnableOption "typst";
  };

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      typst
    ];
  };
}
