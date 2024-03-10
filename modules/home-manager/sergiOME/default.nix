{ lib, ... }:
{
  imports = [
    ./hyprland
    ./waybar
    ./neovim
    ./alacritty
    ./browsing.nix
    ./cli.nix
    ./zsh.nix
    ./tmux.nix
    ./swappy.nix
    ./zathura.nix
  ];

  options.sergiOME = with lib; rec {
    username = mkOption {
      type = types.str;
      default = "sergio";
    };
    # homeDirectory = mkOption {
    #   type = types.str;
    #   default = "/home/${username}";
    # };
  };

  config.programs.home-manager.enable = true;
}
