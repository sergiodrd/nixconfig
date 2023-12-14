{ inputs, ... }:
{
  imports =
    [
      ./hardware-configuration.nix
      inputs.home-manager.nixosModules.home-manager
    ];

  sergiOS = {
    enable = true;
    base.enable = true;
    graphical.enable = true;
    nvidia.enable = true;
    home-manager = {
      enable = true;
      home = ./home.nix;
    };
  };

  networking.hostName = "legion"; 

  system.stateVersion = "23.05"; 
}
