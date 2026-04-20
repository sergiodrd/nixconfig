{ self, inputs, ... }: {
  flake.nixosConfigurations.spectre = inputs.nixpkgs.lib.nixosSystem {
    modules = [
      self.nixosModules.spectreConfiguration
    ];
  };
}
