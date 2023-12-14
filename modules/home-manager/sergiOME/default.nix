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
  ];
  programs.home-manager.enable = true;
}
