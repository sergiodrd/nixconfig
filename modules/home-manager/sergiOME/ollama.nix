{ config, lib, pkgs, ... }:
let
  cfg = config.sergiOME.ollama;
in
{
  options.sergiOME.ollama = with lib; {
    enable = mkEnableOption "ollama";
  };

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      ollama
    ];
  };
}
