{ config, lib, pkgs, ... }:
let
  cfg = config.sergiOME.hyprland;
in
{
  options.sergiOME.hyprland = with lib; {
    enable = mkEnableOption "hyprland";
    useSharedConfig = mkOption {
      type = types.bool;
      default = true;
    };
  };

  config = lib.mkIf cfg.enable {
    # wayland.windowManager.hyprland.enable = true;

    home.file = {
      "hyprland.conf" = {
        source = config.lib.file.mkOutOfStoreSymlink 
        /home/sergio/nixconfig/modules/home-manager/sergiOME/hyprland/hyprland.conf;
        target = ".config/hypr/hyprland.conf";
      };
      "rose-pine-moon.conf" = {
        source = config.lib.file.mkOutOfStoreSymlink 
        /home/sergio/nixconfig/modules/home-manager/sergiOME/hyprland/rose-pine-moon.conf;
        target = ".config/hypr/rose-pine-moon.conf";
      };
    };

    gtk = {
      enable = true;
      theme = {
        name = "rose-pine-gtk-theme";
        package = pkgs.rose-pine-gtk-theme;
      };
      cursorTheme = {
        name = "Bibata-Modern-Ice";
        size = 24;
      };
      iconTheme = {
        name = "rose-pine-icon-theme";
        package = pkgs.rose-pine-icon-theme;
      };
    };

    home.packages = with pkgs; [
      font-awesome
      grim slurp swappy
      swww
      rofi-wayland
    ];
  };
}
