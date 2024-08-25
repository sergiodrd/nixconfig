{ inputs, ... }:
{
  imports =
    [
      ./hardware-configuration.nix
      inputs.home-manager.nixosModules.home-manager
    ];

  sergiOS = {
    enable = true;
    hostname = "spectre";

    base.enable = true;
    graphical.enable = true;
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

  system.stateVersion = "23.05"; 
}
