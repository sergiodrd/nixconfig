{
  config,
  lib,
  pkgs,
  inputs,
  ...
}: let
  cfg = config.sergiOS.stylix;
in {
  imports = [
    inputs.stylix.nixosModules.stylix
  ];

  options.sergiOS.stylix = with lib; {
    enable = mkEnableOption "stylix";
    rice = mkOption {
      type = types.enum ["tokyo_night" "gruvbox"];
      default = "tokyo_night";
    };
  };

  config = lib.mkIf cfg.enable {
    stylix = {
      enable = true;
      autoEnable = true;

      base16Scheme = let
        theme = "${pkgs.base16-schemes}/share/themes";
      in
        if cfg.rice == "tokyo_night"
        then "${theme}/tokyo-night-terminal-dark.yaml"
        else if cfg.rice == "gruvbox"
        then "${theme}/gruvbox-material-dark-hard.yaml"
        else "";

      image =
        if cfg.rice == "tokyo_night"
        then
          pkgs.fetchurl {
            url = "https://github.com/zhichaoh/catppuccin-wallpapers/blob/main/landscapes/Cloudsnight.jpg?raw=true";
            hash = "sha256-jBv9iKBVQbgd1cmv+ubiJQH7qydRJZTShmwzEiJJcDA=";
          }
        else if cfg.rice == "gruvbox"
        then
          pkgs.fetchurl {
            url = "https://github.com/AngelJumbo/gruvbox-wallpapers/blob/main/wallpapers/anime/ghibli-japanese-walled-garden.png?raw=true";
            hash = "sha256-10Lv25V0RG0mnw/O90DeVchCNWJbdktUADtuI+enEwM=";
          }
        else "";

      cursor = with pkgs; {
        package = rose-pine-cursor;
        name = "BreezeX-RosePine-Linux";
        size = 24;
      };

      fonts = let
        iosevka = pkgs.nerdfonts.override {fonts = ["Iosevka"];};
      in {
        serif = {
          package = iosevka;
          name = "Iosevka Nerd Font Regular";
        };

        sansSerif = {
          package = iosevka;
          name = "Iosevka Nerd Font Regular";
        };

        monospace = {
          package = iosevka;
          name = "Iosevka Nerd Font Mono";
        };

        emoji = {
          package = pkgs.noto-fonts-emoji;
          name = "Noto Color Emoji";
        };

        sizes = {
          applications = 11;
          desktop = 11;
          popups = 11;
          terminal = 11;
        };
      };

      opacity.terminal = 0.8;
    };
  };
}
