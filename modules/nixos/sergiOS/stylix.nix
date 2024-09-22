{ config, lib, pkgs, inputs, ... }:
let
  cfg = config.sergiOS;
in
{
  imports = [
    inputs.stylix.nixosModules.stylix
  ];

  options.sergiOS.stylix = with lib; {
    enable = mkEnableOption "stylix";
  };

  config = lib.mkIf cfg.stylix.enable {
    stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/tokyo-night-dark.yaml";
    stylix.image = /home/${cfg.user}/nixconfig/wallpapers/wallpaper;
  };
}
