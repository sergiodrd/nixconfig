{
  config,
  lib,
  pkgs,
  inputs,
  ...
}: let
  cfg = config.sergiOS.graphical;
in {
  imports = [
    inputs.niri.nixosModules.niri
  ];

  options.sergiOS.graphical = with lib; {
    enable = mkEnableOption "graphical";
    niri = mkOption {
      type = types.bool;
      default = false;
    };
    hyprland = mkOption {
      type = types.bool;
      default = false;
    };
  };

  config = lib.mkIf cfg.enable {
    programs.niri.enable = cfg.niri;
    programs.hyprland.enable = cfg.hyprland;
    services.blueman.enable = true;

    environment.systemPackages = with pkgs; [
      libnotify
      networkmanagerapplet
      brightnessctl
      clipse
      wl-clipboard
      grim
      slurp
      swappy
      xdg-utils
    ];

    environment.sessionVariables = {
      NIXOS_OZONE_WL = 1;
      DEFAULT_BROWSER = "${pkgs.firefox}/bin/firefox";
    };

    xdg.portal = {
      enable = true;
      extraPortals = with pkgs; [
        xdg-desktop-portal-gtk
      ];
    };

    xdg.mime.defaultApplications = {
      "text/html" = "firefox.desktop";
      "x-scheme-handler/http" = "firefox.desktop";
      "x-scheme-handler/https" = "firefox.desktop";
      "x-scheme-handler/about" = "firefox.desktop";
      "x-scheme-handler/unknown" = "firefox.desktop";
    };

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
