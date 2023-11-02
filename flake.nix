{
  description = "My NixOS config :)";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, ... } @ inputs: 
  let
    system = "x86_64-linux";

    nixosModules = import ./modules/config.nix;
    homeManagerModules = import ./modules/home.nix;
  in {
    inherit nixosModules homeManagerModules;

    nixosConfigurations = {
      legion = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit system; };

        modules = [
          nixosModules
          ./nixos/legion
        ];
      };

      spectre = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit system inputs; };

        modules = [
          nixosModules
          ./nixos/spectre
        ];
      };
    };
  };
}
