{...}: {
  home.stateVersion = "22.11";

  sergiOME = {
    hyprland.enable = true;
    waybar.enable = true;
    swappy.enable = true;

    alacritty.enable = true;
    zsh.enable = true;
    tmux.enable = true;
    cli = {
      enable = true;
      personalGit.enable = true;
    };

    neovim.enable = true;

    browsing = {
      enable = true;
      firefox.enable = true;
      qutebrowser.enable = true;
    };
  };
}
