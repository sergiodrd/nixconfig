{ config, lib, hostname, ... }:
let
  cfg = config.sergiOME;
in
{
  options.sergiOME.zsh = with lib; {
    enable = mkEnableOption "zsh";
  };

  config = lib.mkIf cfg.zsh.enable {
    programs = {
      direnv = {
        enable = true;
        enableZshIntegration = true;
        nix-direnv.enable = true;
      };
      starship = {
        enable = true;
        enableZshIntegration = true;
      };
      zsh = {
        enable = true;
        enableAutosuggestions = true;
        enableCompletion = true;
        autocd = true;
        dotDir = ".config/zsh";
        historySubstringSearch.enable = true;
        syntaxHighlighting.enable = true;
        shellAliases = {
          rebuild = "sudo nixos-rebuild switch --flake /home/${cfg.username}/nixconfig#${hostname} --show-trace";
          ls = "eza";
          ll = "eza -l";
          l = "eza -ll";
        };
      };
    };
  };
}
