{inputs, ...}: {
  imports = [
    ./hardware-configuration.nix
    inputs.home-manager.nixosModules.home-manager
  ];

  sergiOS = {
    enable = true;
    hostname = "spectre";

    base.enable = true;
    stylix = {
      enable = true;
      rice = "gruvbox";
    };
    graphical = {
      enable = true;
      niri = true;
      hyprland = true;
    };
    home-manager = {
      enable = true;
      home = ./home.nix;
    };

    docker = {
      enable = true;
      rootless = false;
    };
    virtualbox.enable = true;

    tailscale.enable = true;
  };

  services.openvpn.servers.cdcc = {config = ''config /root/nixos/openvpn/CDCC/CCOM-client.conf '';};

  system.stateVersion = "23.05";
}
