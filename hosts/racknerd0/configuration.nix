{inputs, ...}: {
  imports = [
    ./hardware-configuration.nix
  ];

  sergiOS = {
    enable = true;
    hostname = "racknerd0";

    base.enable = true;
    tailscale.enable = true;
  };

  system.stateVersion = "24.11";
}
