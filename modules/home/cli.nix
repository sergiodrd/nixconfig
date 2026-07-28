{ inputs, self, ... }: {
  flake.homeManagerModules.cli = {
    config,
    lib,
    pkgs,
    ...
  }: let
    cfg = config.sergiOME.cli;
  in {
    options.sergiOME.cli = with lib; {
      personalGit.enable = mkEnableOption "personalGit";
    };

    config = {
      programs = {
        git = {
          enable = true;
          settings.user.name = lib.mkIf cfg.personalGit.enable "sergio";
          settings.user.email = lib.mkIf cfg.personalGit.enable "sergiod.roddj@gmail.com";
          signing.format = "openpgp";
        };
        bat.enable = true;
        fzf.enable = true;
        htop.enable = true;
        btop.enable = true;
        jq.enable = true;
        zoxide = {
          enable = true;
          enableZshIntegration = true;
        };
        yazi = {
          enable = true;
          enableZshIntegration = true;
          shellWrapperName = "yy";
        };
      };

      home.packages = with pkgs; [
        colordiff
        curl
        wget
        eza
        fastfetch
        nix-tree
        discord
        discordo
        cowsay
      ];
    };
  };
}
