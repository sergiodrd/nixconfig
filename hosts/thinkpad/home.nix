{ ... }:
{
  home.stateVersion = "22.11"; 

  sergiOME = {
    zsh.enable = true;
    tmux.enable = true;
    cli = {
      enable = true;
      personalGit.enable = true;
    };
    programming.enable = true;

    neovim.enable = true;
  };
}
