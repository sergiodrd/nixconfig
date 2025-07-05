{...}: {
  home.stateVersion = "22.11";

  sergiOME = {
    alacritty.enable = true;
    zsh.enable = true;
    tmux.enable = true;
    cli = {
      enable = true;
      personalGit.enable = true;
    };

    neovim.enable = true;
  };
}
