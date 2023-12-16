{ config, lib, ... }:
let
  cfg = config.sergiOS.nvidia;
in
{
  options.sergiOS.nvidia = with lib; {
    enable = mkEnableOption "nvidia";
  };

  config = lib.mkIf cfg.enable {
    programs.hyprland = lib.mkIf config.sergiOS.graphical.enable {
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
  };
}
