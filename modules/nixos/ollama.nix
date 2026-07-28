{ inputs, self, ... }: {
  flake.nixosModules.ollama = {
    config,
    lib,
    ...
  }: {
    config = {
      services.ollama.enable = true;
    };
  };
}
