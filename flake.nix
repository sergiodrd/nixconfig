{
  description = "My NixOS config :)";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, ... }@inputs: 
  let
    system = "x86_64-linux";
  
    pkgs = import nixpkgs {
      inherit system;

      config = {
        allowUnfree = true;
      };
    };

    nixosModules = import ./nixos/common/config.nix;
    homeManagerModules = import ./nixos/common/home.nix;
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
