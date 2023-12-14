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
    home-manager = {
      enable = true;
      home = ./home.nix;
    };
  };

  # programs.hyprland = {
  #   enable = true;
  #   xwayland.enable = true;
  # };
  networking.hostName = "spectre"; 

  # home-manager = {
  #   extraSpecialArgs = { inherit inputs; };
  #   users.sergio = import ./home.nix;
  # };

  system.stateVersion = "23.05"; 
}
