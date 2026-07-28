{ inputs, self, ... }: {
  flake.nixosModules.stylix = {
    config,
    lib,
    pkgs,
    ...
  }: let
    cfg = config.sergiOS.stylix;
  in {
    imports = [
      inputs.stylix.nixosModules.stylix
    ];

    options.sergiOS.stylix = with lib; {
      rice = mkOption {
        type = types.enum ["tokyo_night" "gruvbox"];
        default = "tokyo_night";
      };
    };

    config = {
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
          then ../../wallpapers/Cloudsnight.jpg
          else if cfg.rice == "gruvbox"
          then ../../wallpapers/classroom.jpg
          else "";

        cursor = with pkgs; {
          package = rose-pine-cursor;
          name = "BreezeX-RosePine-Linux";
          size = 24;
        };

        fonts = let
          iosevka = pkgs.nerd-fonts.iosevka;
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
            package = pkgs.noto-fonts-color-emoji;
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
  };
}
