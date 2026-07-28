{ inputs, self, ... }: {
  flake.homeManagerModules.obsidian = {
    config,
    lib,
    pkgs,
    ...
  }: {
    config = {
      home.packages = with pkgs; [
        obsidian
      ];
    };
  };
}
