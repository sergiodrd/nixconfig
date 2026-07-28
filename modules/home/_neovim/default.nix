{ inputs }:
{
  config,
  lib,
  pkgs,
  ...
}: let
  home_dir = config.sergiOME.homeDirectory;
in {
  imports = [
    inputs.nixvim.homeModules.nixvim
  ];

  config = {
    programs.nixvim = {
      enable = true;
      defaultEditor = true;

      viAlias = true;
      vimAlias = true;

      extraConfigLua = ''
        vim.opt.isfname:append("@-@")
      '';

      autoGroups = {
        highlight_yank.clear = true;
        blade_alias.clear = true;
      };

      autoCmd = import ./autocmd.nix;

      globals = import ./globals.nix;

      opts = import ./options.nix {inherit home_dir;};

      keymaps = import ./keymaps.nix;

      plugins = import ./plugins {inherit pkgs;};
    };

    home.packages = with pkgs; [
      isort
      black
      alejandra
      stylua
      codespell
      ripgrep
    ];
  };
}
