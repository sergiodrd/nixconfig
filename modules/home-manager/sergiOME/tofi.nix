{ config, pkgs, lib, ... }:
let 
  cfg = config.sergiOME.tofi;
in
{
  options.sergiOME.tofi = with lib; {
    enable = mkEnableOption "tofi";
  };

  config.programs.tofi = lib.mkIf cfg.enable {
    enable = true;
    settings = {
      width = "100%";
      height = "100%";
      border-width = 0;
      outline-width = 0;
      padding-left = "35%";
      padding-top = "35%";
      result-spacing = 25;
      num-results = 5;
      font = "Iosevka Elite";
      background-color = "#000A";
    };
  };
}
