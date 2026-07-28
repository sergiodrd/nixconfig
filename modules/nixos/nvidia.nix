{ inputs, self, ... }: {
  flake.nixosModules.nvidia = {
    config,
    lib,
    ...
  }: {
    config = {
      programs.hyprland = lib.mkIf config.sergiOS.graphical.hyprland {
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
  };
}
