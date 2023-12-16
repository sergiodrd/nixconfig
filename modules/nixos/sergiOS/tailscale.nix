{ config, lib, ... }:
let
  cfg = config.sergiOS.tailscale;
in
{
  options.sergiOS.tailscale = with lib; {
    enable = mkEnableOption "tailscale";
  };

  config = lib.mkIf cfg.enable {
    services.tailscale = {
      enable = true;
    };
  };
}
