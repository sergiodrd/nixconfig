{lib, ...}: {
  imports = [
    ./base.nix
    ./nvidia.nix
    ./user.nix
    ./graphical.nix
    ./docker.nix
    ./tailscale.nix
    ./virtualbox.nix
    ./stylix.nix
    ./caddy.nix
    ./glance.nix
  ];

  options.sergiOS = with lib; {
    enable = mkEnableOption "sergiOS";
    hostname = mkOption {
      type = types.str;
    };
  };
}
