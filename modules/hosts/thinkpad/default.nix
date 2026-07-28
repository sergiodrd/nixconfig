{ self, inputs, ... }: {
  flake.nixosConfigurations.thinkpad = inputs.nixos-nixpkgs.lib.nixosSystem {
    modules = [ self.nixosModules.hostThinkpad ];
  };

  flake.nixosModules.hostThinkpad = { lib, ... }: {
    imports = [
      self.nixosModules.base
      self.nixosModules.user
      self.nixosModules.tailscale
      self.nixosModules.docker
      self.nixosModules.virtualbox
      inputs.home-manager.nixosModules.home-manager
    ];

    sergiOS.hostname = "thinkpad";
    system.stateVersion = "23.05";

    boot.loader.grub.enable = true;
    boot.loader.grub.device = "/dev/sda";

    home-manager = {
      useGlobalPkgs = lib.mkDefault true;
      useUserPackages = lib.mkDefault true;
      extraSpecialArgs = {
        inherit inputs;
        hostname = "thinkpad";
      };
      sharedModules = with self.homeManagerModules; [
        core
        cli
        zsh
        tmux
        neovim
        programming
      ];
      users.sergio = import ./_home.nix;
      backupFileExtension = "backup";
    };
  };
}
