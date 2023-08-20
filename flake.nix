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
  in {
    nixosConfigurations = {
      legion = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit system; };

        modules = [
	  ./nixos/common
          ./nixos/legion
        ];
      };

      spectre = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit system inputs; };

        modules = [
	  ./nixos/common
          ./nixos/spectre
        ];
      };
    };
  };
}
