{ config, lib, ... }:
let
  cfg = config.sergiOME.swappy;
in
{
  options.sergiOME.swappy = with lib; {
    enable = mkEnableOption "swappy";
  };

  config = lib.mkIf cfg.enable {
    home.file.".config/swappy/config".text =''
      [Default]
      save_dir=$HOME/screenshots
      early_exit=true
    '';
  };
}
