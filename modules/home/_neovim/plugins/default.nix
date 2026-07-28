{pkgs}: {
  # nice
  web-devicons.enable = true;
  lualine.enable = true;
  dressing.enable = true;
  indent-blankline.enable = true;
  nvim-autopairs.enable = true;
  colorizer.enable = true;
  notify.enable = true;
  noice.enable = true;
  todo-comments = {
    enable = true;
    settings.signs = false;
  };
  mini = {
    enable = true;
    modules = {
      ai.n_lines = 500;
    };
  };

  # oil up the neovim
  oil.enable = true;

  # indents
  sleuth.enable = true;

  # git
  fugitive.enable = true;
  gitsigns = {
    enable = true;
    settings.signs = {
      add.text = "+";
      change.text = "~";
      delete.text = "_";
      topdelete.text = "‾";
      changedelete.text = "~";
    };
  };

  # comments
  comment.enable = true;

  # shoutout primeagen fr
  harpoon = {
    enable = true;
    enableTelescope = true;
  };

  # shoutout tj fr
  telescope = import ./telescope.nix;

  # language stuff
  fidget.enable = true;
  friendly-snippets.enable = true;
  luasnip.enable = true;
  conform-nvim = import ./conform.nix;
  lsp = import ./lsp.nix {inherit pkgs;};
  cmp = import ./cmp.nix;
  treesitter = import ./treesitter.nix;
}
