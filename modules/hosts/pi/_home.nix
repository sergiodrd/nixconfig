{...}: {
  home.stateVersion = "22.11";

  sergiOME = {
    cli.personalGit.enable = true;
    browsing = {
      firefox.enable = true;
      qutebrowser.enable = true;
    };
    tools.swappy.enable = true;
  };
}
