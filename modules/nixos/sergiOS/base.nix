{ config, lib, pkgs, ... }:
let
  cfg = config.sergiOS.base;
in
{
  options.sergiOS.base = with lib; {
    enable = mkEnableOption "base";
    graphical = mkOption {
      type = lib.types.bool;
      default = true;
    };
  };

  config = lib.mkIf cfg.enable {
    nix.settings.experimental-features = [ "nix-command" "flakes" ];
    nixpkgs.config.allowUnfree = true;

    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;

    networking.networkmanager.enable = true;

    hardware.bluetooth.enable = true;

    time.timeZone = "America/Puerto_Rico";
    i18n.defaultLocale = "en_US.UTF-8";
    i18n.extraLocaleSettings = {
      LC_ADDRESS = "es_PR.UTF-8";
      LC_IDENTIFICATION = "es_PR.UTF-8";
      LC_MEASUREMENT = "es_PR.UTF-8";
      LC_MONETARY = "es_PR.UTF-8";
      LC_NAME = "es_PR.UTF-8";
      LC_NUMERIC = "es_PR.UTF-8";
      LC_PAPER = "es_PR.UTF-8";
      LC_TELEPHONE = "es_PR.UTF-8";
      LC_TIME = "es_PR.UTF-8";
    };

    environment.systemPackages = with pkgs; [
      git
      libgccjit
      ntfs3g
      gnumake
      gcc
      dnsutils
      pciutils
      file
      lf
    ];
  };
}
