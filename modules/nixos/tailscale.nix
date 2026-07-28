{ inputs, self, ... }: {
  flake.nixosModules.tailscale = {
    config,
    lib,
    ...
  }: {
    config = {
      services.tailscale.enable = true;
    };
  };
}
