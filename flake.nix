{
  description = "My NixOS config :)";

  inputs = {
    nixos-nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixpkgs-unstable";

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixos-nixpkgs";

    nixos-hardware.url = "github:NixOS/nixos-hardware/master";

    niri.url = "github:sodiboo/niri-flake";
    niri.inputs.nixpkgs.follows = "nixos-nixpkgs";

    stylix.url = "github:danth/stylix";
    stylix.inputs.nixpkgs.follows = "nixos-nixpkgs";

    nixvim.url = "github:nix-community/nixvim";
    nixvim.inputs.nixpkgs.follows = "nixos-nixpkgs";
  };

  outputs = {
    self,
    nixos-nixpkgs,
    ...
  } @ inputs: let
    inherit (self) outputs;

    nixosModules = import ./modules/nixos;
    homeManagerModules = import ./modules/home-manager;

    specialArgs = {inherit inputs outputs;};
  in rec {
    inherit nixosModules homeManagerModules;

    nixosConfigurations = let
      defaultModules = builtins.attrValues nixosModules;
    in {
      legion = nixos-nixpkgs.lib.nixosSystem {
        inherit specialArgs;
        modules =
          defaultModules
          ++ [
            ./hosts/legion/configuration.nix
          ];
      };

      spectre = nixos-nixpkgs.lib.nixosSystem {
        inherit specialArgs;
        modules =
          defaultModules
          ++ [
            ./hosts/spectre/configuration.nix
          ];
      };

      pi = nixos-nixpkgs.lib.nixosSystem {
        inherit specialArgs;
        modules =
          defaultModules
          ++ [
            ./hosts/pi/configuration.nix
            inputs.nixos-hardware.raspberry-pi-4
          ];
      };

      thinkpad = nixos-nixpkgs.lib.nixosSystem {
        inherit specialArgs;
        modules =
          defaultModules
          ++ [
            ./hosts/thinkpad/configuration.nix
          ];
      };

      racknerd0 = nixos-nixpkgs.lib.nixosSystem {
          inherit specialArgs;
          modules =
            defaultModules
            ++ [
              ./hosts/racknerd0/configuration.nix
            ];
      };
    };
  };
}
