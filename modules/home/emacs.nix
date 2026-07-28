{ inputs, self, ... }: {
  flake.homeManagerModules.emacs = {
    config,
    lib,
    pkgs,
    ...
  }: {
    config = {
      home.packages = with pkgs; [ripgrep];
      programs.emacs.enable = true;
    };
  };
}
