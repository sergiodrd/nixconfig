{ inputs, self, ... }: {
  flake.homeManagerModules.zathura = {
    config,
    lib,
    pkgs,
    ...
  }: {
    config.programs.zathura.enable = true;
  };
}
