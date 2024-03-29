{ config, inputs, lib, pkgs, ... }:
let 
  cfg = config.sergiOME.neovim;
in
{
  options.sergiOME.neovim = with lib; {
    enable = mkEnableOption "neovim";
  };

  config = lib.mkIf cfg.enable {
    programs.neovim = {
      enable = true;
      defaultEditor = true;
      viAlias = true;
      vimAlias = true;
      vimdiffAlias = true;

      extraPackages = with pkgs; [
        # misc deps
        unzip
        ripgrep

        # language servers
        lua-language-server
        gopls
        nodePackages.pyright isort black
        rust-analyzer
      ];
    };

    home.file.nvim = {
      # recursive = true;
      source = config.lib.file.mkOutOfStoreSymlink 
      /home/sergio/nixconfig/modules/home-manager/sergiOME/neovim/init.lua;
      target = ".config/nvim/init.lua";
    };
  };
}
