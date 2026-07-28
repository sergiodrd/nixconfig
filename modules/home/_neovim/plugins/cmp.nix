{
  enable = true;
  autoEnableSources = true;
  settings = {
    sources = [
      {
        name = "nvim_lsp";
        priority = 1;
      }
      {
        name = "luasnip";
        priority = 2;
      }
      {
        name = "path";
        priority = 3;
      }
      {
        name = "buffer";
        priority = 4;
      }
    ];
    snippet.expand =
      /*
      lua
      */
      ''
             function(args)
        require('luasnip').lsp_expand(args.body)
             end
      '';
    completion.completeopt = "menu,menuone,noinsert";
    mapping = {
      "<C-j>" =
        /*
        lua
        */
        "cmp.mapping.select_next_item()";
      "<C-k>" =
        /*
        lua
        */
        "cmp.mapping.select_prev_item()";
      "<CR>" =
        /*
        lua
        */
        "cmp.mapping.confirm({ select = false })";
      "<C-b>" =
        /*
        lua
        */
        "cmp.mapping.scroll_docs(-4)";
      "<C-f>" =
        /*
        lua
        */
        "cmp.mapping.scroll_docs(4)";
      "<C-Space>" =
        /*
        lua
        */
        "cmp.mapping.complete({})";
      "<C-e>" =
        /*
        lua
        */
        "cmp.mapping.abort()";
      "<C-l>" =
        /*
        lua
        */
        ''
          cmp.mapping(function()
            if require('luasnip').expand_or_locally_jumpable() then
              require('luasnip').expand_or_jump()
            end
          end)
        '';
      "<C-h>" =
        /*
        lua
        */
        ''
          cmp.mapping(function()
            if require('luasnip').locally_jumpable(-1) then
              require('luasnip').jump(-1)
            end
          end)
        '';
    };
  };
}
