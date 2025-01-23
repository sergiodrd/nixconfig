{pkgs}: {
  enable = true;
  inlayHints = true;
  servers = {
    lua_ls.enable = true;
    nixd = {
      enable = true;
      settings = {
        nixpkgs.expr = "import <nixpkgs> { }";
        formatting.command = ["alejandra"];
        options = {
          nixos.expr = "(builtins.getFlake \"github:sergiodrd/nixconfig\").nixosModules.options";
          home_manager.expr = "(builtins.getFlake \"github:sergiodrd/nixconfig\").homeManagerModules.options";
        };
      };
    };
    clangd.enable = true;
    gleam.enable = true;
    ts_ls.enable = true;
    typst_lsp.enable = true;
    gopls.enable = true;
    rust_analyzer = {
      enable = true;
      installCargo = true;
      installRustc = true;
    };
    pyright.enable = true;
    intelephense = {
      enable = true;
      package = pkgs.intelephense;
    };
  };
  keymaps.lspBuf = {
    "<leader>rn" = "rename";
    "<leader>ca" = "code_action";
    K = "hover";
    gD = "declaration";
  };
}
