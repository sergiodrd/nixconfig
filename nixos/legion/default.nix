{ config, pkgs, ... }:
{
  imports =
    [
      ./hardware-configuration.nix
    ];

  programs.hyprland = {
    enable = true;
    nvidiaPatches = true;
    xwayland.enable = true;
  };

  environment.sessionVariables = {
    WLR_NO_HARDWARE_CURSORS = "1";
    NIXOS_OZONE_WL = "1";
  };

  hardware = {
    opengl.enable = true;
    nvidia.modesetting.enable = true;
  };

 # home-manager = {
 #   extraSpecialArgs = { inherit inputs; };
 #   users.sergio = import ./home.nix;
 # };
}
