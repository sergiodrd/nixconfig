{ inputs, self, ... }: {
  flake.homeManagerModules.browsing = {
    config,
    lib,
    ...
  }: let
    cfg = config.sergiOME.browsing;
  in {
    options.sergiOME.browsing = with lib; {
      firefox.enable = mkEnableOption "firefox";
      floorp.enable = mkEnableOption "floorp";
      qutebrowser.enable = mkEnableOption "qutebrowser";
    };

    config = {
      stylix.targets.firefox.profileNames = lib.mkIf cfg.firefox.enable [ "default" ];
      stylix.targets.floorp.profileNames = lib.mkIf cfg.floorp.enable [ "default" ];

      programs = {
        firefox = lib.mkIf cfg.firefox.enable {
          enable = true;
        };
        floorp = lib.mkIf cfg.floorp.enable {
          enable = true;
        };
        qutebrowser = lib.mkIf cfg.qutebrowser.enable {
          enable = true;
        };
      };
    };
  };
}
