{ inputs, config, pkgs, ... }:

{
  home.username = "sergio";
  home.homeDirectory = "/home/sergio";

  home.packages = [
    (pkgs.nerdfonts.override { fonts = [ "Iosevka" "IosevkaTerm" ]; })
  ];

  programs = {
    git = {
      enable = true;
      userName = "sergio";
      userEmail = "sergiod.roddj@gmail.com";
    };
    alacritty.enable = true;
    zsh = (import ./zsh.nix { inherit pkgs; });
    tmux = (import ./tmux.nix { inherit pkgs; });
  };

  home.file = {
    "alacritty.yml" = {
      source = ./alacritty.yml;
      target = ".config/alacritty/alacritty.yml";
    };
    ".p10k.zsh" = {
      source = ./.p10k.zsh;
      target = ".config/zsh/.p10k.zsh";
    };
  };

  gtk = {
    enable = true;
    theme.name = "adw-gtk3";
    cursorTheme = {
      name = "Bibata-Modern-Ice";
      size = 24;
    };
    iconTheme.name = "GruvboxPlus";
  };

  home.stateVersion = "22.11"; 
  programs.home-manager.enable = true;
}
