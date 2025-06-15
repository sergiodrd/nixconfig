{
  config,
  lib,
  pkgs,
  inputs,
  ...
}: let
  cfg = config.sergiOS;
in {
  options.sergiOS.base = with lib; {
    enable = mkEnableOption "base";
    bios = mkOption {
      type = types.submodule {
        options = {
          enable = mkEnableOption "bios";
          grubDevice = mkOption {
            type = types.string;
          };
        };
      };
      default = {};
    };
    withNetworkManager = mkOption {
      type = types.bool;
      default = true;
    };
    withBluetooth = mkOption {
      type = types.bool;
      default = true;
    };
  };

  config = lib.mkIf cfg.base.enable {
    assertions = [
      {
        assertion = !(cfg.base.bios.enable) || cfg.base.bios.grubDevice != "";
        message = "You must set 'bios.grubDevice' if 'bios.enable' is true.";
      }
    ];

    nix.settings.experimental-features = ["nix-command" "flakes"];
    nix.nixPath = ["nixpkgs=${inputs.nixos-nixpkgs}"];
    nixpkgs.config.allowUnfree = true;

    boot.loader.grub = lib.mkIf cfg.base.bios.enable {
      enable = true;
      device = cfg.base.bios.grubDevice;
    };

    boot.loader.systemd-boot.enable = !cfg.base.bios.enable;
    boot.loader.efi.canTouchEfiVariables = !cfg.base.bios.enable;

    networking.networkmanager.enable = cfg.base.withNetworkManager;
    networking.firewall.checkReversePath = "loose";
    networking.hostName = cfg.hostname;

    systemd.services.NetworkManager-wait-online.enable = lib.mkForce false;

    hardware.bluetooth.enable = cfg.base.withBluetooth;

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
      intel-ocl
      inotify-tools
    ];
  };
}
