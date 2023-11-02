{ inputs, config, pkgs, ... }:
{
  imports =
    [
      ./hardware-configuration.nix
      inputs.home-manager.nixosModules.home-manager
    ];

  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };
  networking.hostName = "spectre"; 

  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    users.sergio = import ./home.nix;
  };
}
