{...}: {
  home.stateVersion = "22.11";

  sergiOME = {
    hyprland.enable = true;
    niri.enable = true;
    waybar.enable = true;
    swappy.enable = true;

    alacritty.enable = true;
    zsh.enable = true;
    tmux.enable = true;
    cli = {
      enable = true;
      personalGit.enable = true;
    };
    programming.enable = true;
    ollama.enable = true;

    obsidian.enable = true;
    zathura.enable = true;
    typst.enable = true;

    neovim.enable = true;
    emacs.enable = true;

    browsing = {
      enable = true;
      firefox.enable = true;
      floorp.enable = true;
    };
  };
}
