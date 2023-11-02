{ inputs, config, pkgs, ... }:

{
  home.username = "sergio";
  home.homeDirectory = "/home/sergio";

  home.packages = [
    pkgs.font-awesome
    (pkgs.nerdfonts.override { fonts = [ "Iosevka" "IBMPlexMono" ]; })
  ];

  programs = {
    git = {
      enable = true;
      userName = "sergio";
      userEmail = "sergiod.roddj@gmail.com";
    };
    direnv = {
      enable = true;
      enableZshIntegration = true;
    };
    alacritty.enable = true;
    zsh = (import ./zsh.nix { inherit pkgs; });
    tmux = (import ./tmux.nix { inherit pkgs inputs; });
    neovim = (import ./nvim { inherit pkgs; });
    waybar = (import ./waybar { inherit pkgs; });
    texlive.enable = true;
  };

  home.file = {
    "alacritty.yml" = {
      source = config.lib.file.mkOutOfStoreSymlink /home/sergio/nixconfig/nixos/spectre/alacritty.yml;
      target = ".config/alacritty/alacritty.yml";
    };
    ".p10k.zsh" = {
      source = config.lib.file.mkOutOfStoreSymlink /home/sergio/nixconfig/nixos/spectre/.p10k.zsh;
      target = ".config/zsh/.p10k.zsh";
    };
    "nvim" = {
      recursive = true;
      source = config.lib.file.mkOutOfStoreSymlink /home/sergio/nixconfig/nixos/spectre/nvim/lua;
      target = ".config/nvim/lua";
    };
    "hypr" = {
      recursive = true;
      source = config.lib.file.mkOutOfStoreSymlink /home/sergio/nixconfig/nixos/spectre/hyprland;
      target = ".config/hypr";
    };
  };

  gtk = {
    enable = true;
    theme = {
      name = "rose-pine-gtk-theme";
      package = pkgs.rose-pine-gtk-theme;
    };
    cursorTheme = {
      name = "Bibata-Modern-Ice";
      size = 24;
    };
    iconTheme = {
      name = "rose-pine-icon-theme";
      package = pkgs.rose-pine-icon-theme;
    };
  };

  home.stateVersion = "22.11"; 
  programs.home-manager.enable = true;
}
