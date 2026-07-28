{ self, inputs, ... }: {
  flake.nixosConfigurations.pi = inputs.nixos-nixpkgs.lib.nixosSystem {
    modules = [ self.nixosModules.hostPi ];
  };

  flake.nixosModules.hostPi = { lib, config, ... }: {
    imports = [
      self.nixosModules.base
      self.nixosModules.user
      self.nixosModules.graphical
      self.nixosModules.tailscale
      self.nixosModules.docker
      inputs.nixos-hardware.nixosModules.raspberry-pi-4
      inputs.home-manager.nixosModules.home-manager
    ];

    sergiOS.hostname = "pi";
    system.stateVersion = "23.05";

    nixpkgs.hostPlatform = "aarch64-linux";

    sergiOS.graphical.hyprland = true;
    sergiOS.docker.rootless = false;

    home-manager = {
      useGlobalPkgs = lib.mkDefault true;
      useUserPackages = lib.mkDefault true;
      extraSpecialArgs = {
        inherit inputs;
        hostname = "pi";
      };
      sharedModules = with self.homeManagerModules; [
        core
        cli
        zsh
        tmux
        browsing
        hyprland
        waybar
        neovim
        alacritty
        tools
        programming
      ];
      users.sergio = import ./_home.nix;
      backupFileExtension = "backup";
    };
  };
}
