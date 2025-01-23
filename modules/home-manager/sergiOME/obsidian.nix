{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.sergiOME.obsidian;
in {
  options.sergiOME.obsidian = with lib; {
    enable = mkEnableOption "obsidian";
  };

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      obsidian
    ];
  };
}
