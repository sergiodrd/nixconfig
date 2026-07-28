{ inputs, self, ... }: {
  flake.homeManagerModules.alacritty = {
    config,
    lib,
    pkgs,
    ...
  }: {
    config = {
      programs.alacritty = {
        enable = true;
        settings = {
          window.padding = { x = 10; y = 10; };
          env.TERM = "xterm-256color";
        };
      };
    };
  };
}
