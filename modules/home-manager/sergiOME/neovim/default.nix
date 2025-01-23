{
  config,
  lib,
  inputs,
  pkgs,
  ...
}: let
  cfg = config.sergiOME.neovim;
  home_dir = config.sergiOME.homeDirectory;
in {
  imports = [
    inputs.nixvim.homeManagerModules.nixvim
  ];

  options.sergiOME.neovim = with lib; {
    enable = mkEnableOption "neovim";
  };

  config = lib.mkIf cfg.enable {
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
    ];
  };
}
