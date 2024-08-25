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
      xdg-utils
    ];

    environment.sessionVariables = {
      NIXOS_OZONE_WL = 1;
      DEFAULT_BROWSER = "${pkgs.firefox}/bin/firefox";
    };

    xdg.portal = {
      enable = true;
      extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
    };

    xdg.mime.defaultApplications = {
      "text/html" = "firefox.desktop";
      "x-scheme-handler/http" = "firefox.desktop";
      "x-scheme-handler/https" = "firefox.desktop";
      "x-scheme-handler/about" = "firefox.desktop";
      "x-scheme-handler/unknown" = "firefox.desktop";
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
