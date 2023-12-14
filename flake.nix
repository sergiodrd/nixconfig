{
  description = "My NixOS config :)";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, ... } @ inputs: 
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
      legion = nixpkgs.lib.nixosSystem {
        inherit specialArgs;
        modules = defaultModules ++ [
          ./hosts/legion
        ];
      };

      spectre = nixpkgs.lib.nixosSystem {
        inherit specialArgs;
        modules = defaultModules ++ [
          ./hosts/spectre
        ];
      };
    };
  };
}
