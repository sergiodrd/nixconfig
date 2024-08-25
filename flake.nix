{
  description = "My NixOS config :)";

  inputs = {
    nixos-nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixos-nixpkgs";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
    nixvim = {
      url = "github:nix-community/nixvim/main";
      inputs.nixpkgs.follows = "nixos-nixpkgs";
    };
  };

  outputs = { self, nixos-nixpkgs, ... } @ inputs: 
  let
    inherit (self) outputs;

    nixosModules = import ./modules/nixos;
    homeManagerModules = import ./modules/home-manager;

    specialArgs = { inherit inputs outputs; };
  in rec {
    inherit nixosModules homeManagerModules;

    nixosConfigurations = 
    let
      defaultModules = builtins.attrValues nixosModules;
    in
    {
      legion = nixos-nixpkgs.lib.nixosSystem {
        inherit specialArgs;
        modules = defaultModules ++ [
          ./hosts/legion
        ];
      };

      spectre = nixos-nixpkgs.lib.nixosSystem {
        inherit specialArgs;
        modules = defaultModules ++ [
          ./hosts/spectre
        ];
      };

      pi = nixos-nixpkgs.lib.nixosSystem {
        inherit specialArgs;
        modules = defaultModules ++ [
          ./hosts/pi
          inputs.nixos-hardware.raspberry-pi-4
        ];
      };
    };
  };
}
