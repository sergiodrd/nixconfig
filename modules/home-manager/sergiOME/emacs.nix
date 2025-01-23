{
  config,
  inputs,
  lib,
  pkgs,
  ...
}: let
  cfg = config.sergiOME.emacs;
in {
  options.sergiOME.emacs = with lib; {
    enable = mkEnableOption "neovim";
  };

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [ripgrep];
    programs.emacs.enable = true;
  };
}
