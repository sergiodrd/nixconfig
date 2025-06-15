{
  inputs,
  outputs,
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.sergiOS;
in {
  options.sergiOS = with lib; {
    user = mkOption {
      type = types.str;
      default = "sergio";
    };

    home-manager = {
      enable = mkEnableOption "home-manager";
      home = mkOption {
        type = types.path;
      };
    };
  };

  config = {
    home-manager = lib.mkIf cfg.home-manager.enable {
      useGlobalPkgs = lib.mkDefault true;
      useUserPackages = lib.mkDefault true;
      extraSpecialArgs = {
        inherit inputs;
        hostname = cfg.hostname;
        stylix = cfg.stylix;
      };
      sharedModules = builtins.attrValues outputs.homeManagerModules;
      users.${cfg.user} = import cfg.home-manager.home;
      backupFileExtension = "backup";
    };

    users = {
      defaultUserShell = pkgs.zsh;
      users.${cfg.user} = {
        isNormalUser = true;
        extraGroups = ["wheel" "networkmanager" "keys"];
      };
    };

    nix.settings.trusted-users = ["${cfg.user}"];

    programs = {
      neovim = {
        enable = true;
        defaultEditor = true;
      };

      zsh.enable = true;
    };
  };
}
