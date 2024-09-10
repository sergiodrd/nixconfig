{ config, lib, pkgs, inputs, ... }:
let
  cfg = config.sergiOS;
in
{
  options.sergiOS.base = with lib; {
    enable = mkEnableOption "base";
    uefi = mkOption {
      type = types.bool;
      default = true;
    };
  };

  config = lib.mkIf cfg.base.enable {
    nix.settings.experimental-features = [ "nix-command" "flakes" ];
    nix.nixPath = [ "nixpkgs=${inputs.nixos-nixpkgs}" ];
    nixpkgs.config.allowUnfree = true;

    boot.loader.systemd-boot.enable = cfg.base.uefi;
    boot.loader.efi.canTouchEfiVariables = cfg.base.uefi;

    networking.networkmanager.enable = true;
    networking.hostName = cfg.hostname;

    systemd.services.NetworkManager-wait-online.enable = lib.mkForce false;

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

    programs.nix-ld.enable = true;
    # programs.nix-ld.libraries = with pkgs; [
    #   # Add any missing dynamic libraries for unpackaged programs
    #   # here, NOT in environment.systemPackages
    # ];

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
      intel-ocl
      inotify-tools
    ];
  };
}
