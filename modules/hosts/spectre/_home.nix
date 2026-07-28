{...}: {
  home.stateVersion = "22.11";

  sergiOME = {
    cli.personalGit.enable = true;

    browsing = {
      firefox.enable = true;
      floorp.enable = true;
    };

    creative = {
      gimp.enable = true;
      krita.enable = true;
    };

    tools = {
      swappy.enable = true;
      typst.enable = true;
    };
  };
}
