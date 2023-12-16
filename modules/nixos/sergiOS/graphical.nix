{ config, lib, pkgs, ... }:
let
  cfg = config.sergiOS.graphical;
in
{
  options.sergiOS.graphical = with lib; {
    enable = mkEnableOption "graphical";
  };

  config = lib.mkIf cfg.enable {
    programs.hyprland.enable = true;
    services.blueman.enable = true;

    environment.systemPackages = with pkgs; [
      dunst
      libnotify
      networkmanagerapplet
      brightnessctl
      cliphist
      wl-clipboard
      grim slurp swappy
    ];

    xdg.portal = {
      enable = true;
      extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
    };

    sound.enable = true;
    security.rtkit.enable = true;
    services.pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      jack.enable = true;
    };
  };
}
