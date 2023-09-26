{ pkgs, ... }:
{
  enable = true;
  viAlias = true;
  vimAlias = true;
  vimdiffAlias = true;
  withNodeJs = true;
  withPython3 = true;
  defaultEditor = true;
  extraLuaConfig = ''
    require("config.general")
    require("config.remap")

  '';
  plugins = with pkgs.vimPlugins; [
    # plenary obv
    plenary-nvim

    # git stuff
    vim-fugitive
    vim-rhubarb
    {
      plugin = gitsigns-nvim;
      type = "lua";
      config = ''
        require("gitsigns").setup()
      '';
    }

    # nvim look nice or else
    {
      plugin = rose-pine;
      type = "lua";
      config = ''
        require("rose-pine").setup({
          variant = 'moon',
        })
        vim.cmd('colorscheme rose-pine')
      '';
    }
    {
      plugin = nightfly;
      type = "lua";
      config = ''
        require("nightfly")
      '';
    }
    vim-sleuth
    {
      plugin = lualine-nvim;
      type = "lua";
      config = ''
        require("lualine").setup({
          options = {
            theme = require("lualine.themes.rose-pine")
          }
        })
      '';
    }
    {
      plugin = indent-blankline-nvim;
      type = "lua";
      config = ''
        require("config.blankline")
      '';
    }
    {
      plugin = nvim-colorizer-lua;
      type = "lua";
      config = ''
        require("colorizer").setup()
      '';
    }
    nvim-web-devicons

    # language stuff
    {
      plugin = nvim-treesitter.withAllGrammars;
      type = "lua";
      config = ''
        require("config.treesitter")
      '';
    }
    nvim-treesitter-textobjects
    nvim-ts-rainbow
    {
      plugin = fidget-nvim;
      type = "lua";
      config = ''
        require("fidget").setup({})
      '';
    }
    {
      plugin = nvim-lspconfig;
      type = "lua";
      config = ''
        require("config.lsp-config")
      '';
    } 
    {
      plugin = nvim-cmp;
      type = "lua";
      config = ''
        require("config.nvim-cmp")
      '';
    } 
    cmp-path
    cmp-buffer
    cmp-nvim-lsp
    cmp-nvim-lua
    cmp_luasnip
    {
      plugin = nvim-autopairs;
      type = "lua";
      config = ''
        require("nvim-autopairs").setup()
      '';
    }
    {
      plugin = luasnip;
      type = "lua";
      config = ''
        require("config.snippets")
      '';
    }
    friendly-snippets

    # telescope
    {
      plugin = telescope-nvim;
      type = "lua";
      config = ''
        require("config.telescope")
      '';
    }
    telescope-fzy-native-nvim
    telescope-file-browser-nvim
    dressing-nvim

    # misc
    {
      plugin = which-key-nvim;
      type = "lua";
      config = ''
	vim.opt.timeoutlen = 1000
	require("which-key").setup({})
      '';
    }
    {
      plugin = comment-nvim;
      type = "lua";
      config = ''
        require("Comment").setup()
      '';
    }
    neodev-nvim
  ];
  extraPackages = with pkgs; [
    # python
    (python3.withPackages (ps: with ps; [
      setuptools
      pylama
      black
      isort
      debugpy
    ]))
    nodePackages.pyright

    # lua
    lua-language-server
    selene
    stylua

    # nix
    statix
    nixpkgs-fmt
    nil

    # c, c++
    clang-tools
    cppcheck

    # shell scripting
    shfmt
    shellcheck
    shellharden

    # telescope dependencies
    ripgrep
    fd
  ];
}
