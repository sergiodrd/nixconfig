{ config, lib, pkgs, ... }:
let
  cfg = config.sergiOME.cli;
in
{
  options.sergiOME.cli = with lib; {
    enable = mkEnableOption "cli";
    personalGit = {
      enable = mkEnableOption "personalGit";
    };
  };

  config = lib.mkIf cfg.enable {
    programs = {
      git = {
        enable = true;
        userName = lib.mkIf cfg.personalGit.enable "sergio";
        userEmail = lib.mkIf cfg.personalGit.enable "sergiod.roddj@gmail.com";
      };
      bat = {
        enable = true;
      };
      fzf = {
        enable = true;
      };
      htop = {
        enable = true;
      };
      btop = {
        enable = true;
      };
      jq = {
        enable = true;
      };
    };

    home.packages = with pkgs; [
      colordiff
      curl
      wget
      eza
      neofetch
      nix-tree
      postman
    ];
  };
}
