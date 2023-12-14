{ config, lib, ... }:
let
  cfg = config.sergiOME.swappy;
in
{
  options.sergiOME.swappy = with lib; {
    enable = mkEnableOption "swappy";
  };

  config.home.file.".config/swappy/config".text = lib.mkIf cfg.enable ''
    [Default]
    save_dir=$HOME/screenshots
    early_exit=true
  '';
}
