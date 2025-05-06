{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.sergiOME.neovim;
  packDir = config.programs.neovim.finalPackage.passthru.packpathDirs;
in {
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
      withNodeJs = true;

      extraPackages = with pkgs; [
        ripgrep # Telescope
        gcc # needed for nvim-treesitter

        # HTML, CSS, JSON
        vscode-langservers-extracted

        # LazyVim defaults
        stylua
        lua-language-server
        shfmt

        # Markdown extra
        markdownlint-cli2
        marksman

        # JSON and YAML extras
        nodePackages.yaml-language-server

        # Custom
        editorconfig-checker
        shellcheck
      ];

      plugins = with pkgs.vimPlugins; [
        # plugin manager
        lazy-nvim

        # distro
        LazyVim

        # Coding
        mini-pairs
        ts-comments-nvim
        mini-ai
        lazydev-nvim

        # Blink
        blink-cmp
        friendly-snippets

        # Editor
        neo-tree-nvim
        grug-far-nvim
        flash-nvim
        which-key-nvim
        gitsigns-nvim
        trouble-nvim
        todo-comments-nvim

        # Fzf
        fzf-lua

        # Formatting
        conform-nvim

        # Linting
        nvim-lint

        # LSP
        nvim-lspconfig

        # TreeSitter
        nvim-treesitter.withAllGrammars
        nvim-treesitter-textobjects
        nvim-ts-autotag

        # UI
        bufferline-nvim
        lualine-nvim
        noice-nvim
        mini-icons
        nui-nvim

        # Util
        snacks-nvim
        persistence-nvim
        plenary-nvim

        # Mini-comment Extra
        mini-comment
        nvim-ts-context-commentstring

        # Mini-surround Extra
        mini-surround

        # DAP Core Extra
        nvim-dap
        nvim-dap-ui
        nvim-dap-virtual-text
        nvim-nio

        # DAP Neovim Lua Adapter Extra
        # one-small-step-for-vimkind

        # Aerial Extra
        aerial-nvim

        # Illuminate Extra
        vim-illuminate

        # Inc-rename Extra
        inc-rename-nvim

        # Leap Extra
        flit-nvim
        leap-nvim
        vim-repeat

        # Mini-diff Extra
        mini-diff

        # Navic Extra
        nvim-navic

        # Overseer Extra
        overseer-nvim

        # Clangd Extra
        clangd_extensions-nvim

        # Helm Extra
        vim-helm

        # JSON/YAML Extra
        SchemaStore-nvim # load known formats for json and yaml

        # Markdown Extra
        markdown-preview-nvim
        render-markdown-nvim

        # Python Extra
        neotest-python
        nvim-dap-python
        # venv-selector-nvim

        # Rust Extra
        crates-nvim
        rustaceanvim

        # Terraform Extra
        # telescope-terraform-doc-nvim
        # telescope-terraform-nvim

        # LSP Extra
        neoconf-nvim
        none-ls-nvim

        # Test Extra
        neotest

        # Edgy Extra
        edgy-nvim

        # Mini-animate Extra
        mini-animate

        # Treesitter-context Extra
        nvim-treesitter-context

        # Project Extra
        project-nvim

        # Startuptime
        vim-startuptime

        nvim-web-devicons
        nvim-notify
        nvim-lsp-notify

        # smart typing
        guess-indent-nvim

        # LSP
        nvim-lightbulb # lightbulb for quick actions
        nvim-code-action-menu # code action menu
      ];

      extraLuaConfig = ''
        vim.g.mapleader = " "
        require("lazy").setup({
          spec = {
            { "LazyVim/LazyVim", import = "lazyvim.plugins" },

            -- import any extras modules here
            { import = "lazyvim.plugins.extras.coding.mini-comment" },
            { import = "lazyvim.plugins.extras.coding.mini-surround" },
            { import = "lazyvim.plugins.extras.dap.core" },
            { import = "lazyvim.plugins.extras.dap.nlua" },
            -- We need to use Edgy before Aerial
            { import = "lazyvim.plugins.extras.ui.edgy" },
            { import = "lazyvim.plugins.extras.editor.aerial" },
            { import = "lazyvim.plugins.extras.editor.illuminate" },
            { import = "lazyvim.plugins.extras.editor.inc-rename" },
            { import = "lazyvim.plugins.extras.editor.leap" },
            { import = "lazyvim.plugins.extras.editor.mini-diff" },
            { import = "lazyvim.plugins.extras.editor.navic" },
            { import = "lazyvim.plugins.extras.editor.overseer" },
            { import = "lazyvim.plugins.extras.lang.clangd" },
            { import = "lazyvim.plugins.extras.lang.docker" },
            { import = "lazyvim.plugins.extras.lang.helm" },
            { import = "lazyvim.plugins.extras.lang.json" },
            { import = "lazyvim.plugins.extras.lang.markdown" },
            { import = "lazyvim.plugins.extras.lang.nushell" },
            { import = "lazyvim.plugins.extras.lang.python" },
            { import = "lazyvim.plugins.extras.lang.rust" },
            { import = "lazyvim.plugins.extras.lang.terraform" },
            { import = "lazyvim.plugins.extras.lang.yaml" },
            { import = "lazyvim.plugins.extras.lsp.neoconf" },
            { import = "lazyvim.plugins.extras.lsp.none-ls" },
            { import = "lazyvim.plugins.extras.test.core" },
            { import = "lazyvim.plugins.extras.ui.mini-animate" },
            { import = "lazyvim.plugins.extras.ui.treesitter-context" },
            { import = "lazyvim.plugins.extras.util.project" },
            { import = "lazyvim.plugins.extras.util.startuptime" },

            -- The following configs are needed for fixing lazyvim on nix

            -- force enable telescope-fzf-native.nvim
            { "nvim-telescope/telescope-fzf-native.nvim", enabled = true },

            -- disable mason.nvim, use programs.neovim.extraPackages
            { "williamboman/mason-lspconfig.nvim", enabled = false },
            { "williamboman/mason.nvim", enabled = false },
            { "jay-babu/mason-nvim-dap.nvim",      enabled = false },
            -- import/override with your plugins
            { import = "plugins" },
            -- treesitter handled by xdg.configFile."nvim/parser", put this line at the end of spec to clear ensure_installed
            { "nvim-treesitter/nvim-treesitter", opts = { ensure_installed = {} } },
          },
          defaults = {
            lazy = true,
            version = false,
          },
          performance = {
            -- Used for NixOS
            reset_packpath = false,
            rtp = {
	      reset = false,
	    },
          },
          dev = {
            path = "${pkgs.vimUtils.packDir packDir}/pack/myNeovimPackages/start",
            patterns = {""},
          },
          install = {
            missing = false,
          },
        })
      '';
    };

    # Normal LazyVim config here, see https://github.com/LazyVim/starter/tree/main/lua
    xdg.configFile."nvim/lua".source = ./lua;
  };
}
