{inputs, ...}: {
  imports = [
    ./hardware-configuration.nix
    inputs.home-manager.nixosModules.home-manager
  ];

  sergiOS = {
    enable = true;
    hostname = "legion";

    base.enable = true;
    sops.enable = true;
    graphical.enable = true;
    stylix = {
      enable = true;
      rice = "gruvbox";
    };
    home-manager = {
      enable = true;
      home = ./home.nix;
    };

    glance.enable = true;

    tailscale.enable = true;
  };

  services.logind.lidSwitch = "ignore";

  system.stateVersion = "23.05";
}
