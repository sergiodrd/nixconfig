{inputs, lib, config, ...}: {
  imports = [
    ./hardware-configuration.nix
    inputs.home-manager.nixosModules.home-manager
  ];

  sergiOS = {
    enable = true;
    hostname = "racknerd0";

    base = {
      enable = true;
      bios = {
        enable = true;
        grubDevice = "/dev/vda";
      };
      withBluetooth = false;
    };

    caddy.enable = true;
    tailscale.enable = true;
  };

  boot.kernel.sysctl = {
    "net.ipv4.ip_forward" = "1";
    "net.ipv6.conf.all.forwarding" = "1";
  };

  networking.firewall.allowedTCPPorts = [80 443];

  nix.settings.sandbox = false;

  system.stateVersion = "24.11";
}
