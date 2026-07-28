{ self, inputs, ... }: {
  flake.nixosConfigurations.framework = inputs.nixos-nixpkgs.lib.nixosSystem {
    modules = [
      ./_hardware.nix
      self.nixosModules.base
      self.nixosModules.user
      self.nixosModules.graphical
      self.nixosModules.stylix
      self.nixosModules.sops
      self.nixosModules.tailscale
      self.nixosModules.docker
      self.nixosModules.virtualbox
      inputs.nixos-hardware.nixosModules.framework-intel-core-ultra-series1
      inputs.home-manager.nixosModules.home-manager

      ({ pkgs, lib, config, ... }: {
        sergiOS.hostname = "framework";
        system.stateVersion = "25.05";

        sergiOS.graphical.hyprland = true;
        sergiOS.stylix.rice = "gruvbox";
        sergiOS.docker.rootless = false;

        services.desktopManager.cosmic.enable = true;

        home-manager = {
          useGlobalPkgs = lib.mkDefault true;
          useUserPackages = lib.mkDefault true;
          extraSpecialArgs = {
            inherit inputs;
            hostname = "framework";
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
      })
    ];
  };
}
