{
  config,
  lib,
  ...
}: let
  cfg = config.sergiOME.browsing;
in {
  options.sergiOME.browsing = with lib; {
    enable = mkEnableOption "browsing";
    firefox = {
      enable = mkEnableOption "firefox";
    };
    floorp = {
      enable = mkEnableOption "floorp";
    };
    qutebrowser = {
      enable = mkEnableOption "qutebrowser";
    };
  };

  config = lib.mkIf cfg.enable {
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
}
