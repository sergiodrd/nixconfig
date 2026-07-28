{ self, inputs, ... }: {
  flake.nixosConfigurations.racknerd0 = inputs.nixos-nixpkgs.lib.nixosSystem {
    modules = [ self.nixosModules.hostRacknerd0 ];
  };

  flake.nixosModules.hostRacknerd0 = { lib, ... }: {
    imports = [
      ./_hardware.nix
      self.nixosModules.base
      self.nixosModules.user
      self.nixosModules.tailscale
      self.nixosModules.caddy
      inputs.home-manager.nixosModules.home-manager
    ];

    sergiOS.hostname = "racknerd0";
    system.stateVersion = "24.11";

    sergiOS.base.bios = {
      enable = true;
      grubDevice = "/dev/vda";
    };
    sergiOS.base.withBluetooth = false;

    boot.kernel.sysctl = {
      "net.ipv4.ip_forward" = "1";
      "net.ipv6.conf.all.forwarding" = "1";
    };
    networking.firewall.allowedTCPPorts = [80 443];
    nix.settings.sandbox = false;

    home-manager = {
      useGlobalPkgs = lib.mkDefault true;
      useUserPackages = lib.mkDefault true;
      extraSpecialArgs = {
        inherit inputs;
        hostname = "racknerd0";
      };
      sharedModules = with self.homeManagerModules; [
        core
        cli
        zsh
        tmux
        neovim
      ];
      users.sergio = import ./_home.nix;
      backupFileExtension = "backup";
    };
  };
}
