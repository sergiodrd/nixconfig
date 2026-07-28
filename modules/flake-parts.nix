{ lib, ... }: {
  options.flake.homeManagerModules = lib.mkOption {
    type = lib.types.lazyAttrsOf lib.types.unspecified;
    default = {};
  };

  config.systems = [
    "x86_64-linux"
    "aarch64-linux"
  ];
}
