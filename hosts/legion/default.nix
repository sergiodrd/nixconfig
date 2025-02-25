{inputs, ...}: {
  imports = [
    ./hardware-configuration.nix
    inputs.home-manager.nixosModules.home-manager
  ];

  sergiOS = {
    enable = true;
    hostname = "legion";

    base.enable = true;
    graphical.enable = true;
    nvidia.enable = true;
    home-manager = {
      enable = true;
      home = ./home.nix;
    };

    tailscale.enable = true;
  };

  system.stateVersion = "23.05";
}
