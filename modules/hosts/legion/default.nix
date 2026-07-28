{ self, inputs, ... }: {
  flake.nixosConfigurations.legion = inputs.nixos-nixpkgs.lib.nixosSystem {
    modules = [ self.nixosModules.hostLegion ];
  };

  flake.nixosModules.hostLegion = { pkgs, lib, config, ... }: {
    imports = [
      ./_hardware.nix
      self.nixosModules.base
      self.nixosModules.user
      self.nixosModules.graphical
      self.nixosModules.stylix
      self.nixosModules.sops
      self.nixosModules.tailscale
      self.nixosModules.glance
      inputs.home-manager.nixosModules.home-manager
    ];

    sergiOS.hostname = "legion";
    services.logind.lidSwitch = "ignore";
    system.stateVersion = "23.05";

    # stylix rice selection
    sergiOS.stylix.rice = "gruvbox";

    home-manager = {
      useGlobalPkgs = lib.mkDefault true;
      useUserPackages = lib.mkDefault true;
      extraSpecialArgs = {
        inherit inputs;
        hostname = "legion";
        stylix = config.sergiOS.stylix;
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
        creative
        obsidian
        zathura
        emacs
      ];
      users.sergio = import ./_home.nix;
      backupFileExtension = "backup";
    };
  };
}
