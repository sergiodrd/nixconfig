{ config, lib, pkgs, ... }:
let
  cfg = config.sergiOME.alacritty;
in
{
  options.sergiOME.alacritty = with lib; {
    enable = mkEnableOption "alacritty";
  };

  config = lib.mkIf cfg.enable {
    programs.alacritty.enable = true;
    home.file."alacritty.yml" = {
      source = config.lib.file.mkOutOfStoreSymlink
      /home/sergio/nixconfig/modules/home-manager/sergiOME/alacritty/alacritty.yml;
      target = ".config/alacritty/alacritty.yml";
    };
    home.packages = with pkgs; [ 
      (nerdfonts.override { fonts = [ "Iosevka" "IBMPlexMono" ]; })
    ];
  };
}
