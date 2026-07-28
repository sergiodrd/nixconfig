{
  enable = true;
  settings.defaults = {
    path_display = ["truncate"];
    mappings.i = {
      "<C-enter>" = "to_fuzzy_refine";
      "<C-k>" = {
        __raw = "require('telescope.actions').move_selection_previous";
      };
      "<C-j>" = {
        __raw = "require('telescope.actions').move_selection_next";
      };
      "<C-q>" = {
        __raw = ''
          require('telescope.actions').send_selected_to_qflist +
          require('telescope.actions').open_qflist
        '';
      };
    };
  };
  settings.pickers = {};
  extensions = {
    manix.enable = true;
    ui-select.enable = true;
    fzf-native = {
      enable = true;
      settings = {
        fuzzy = true;
        override_generic_sorter = true;
        override_file_sorter = true;
        case_mode = "smart_case";
      };
    };
  };
  keymaps = {
    "<leader>sh" = {
      action = "help_tags";
      options.desc = "[S]earch [H]elp";
    };
    "<leader>sk" = {
      action = "keymaps";
      options.desc = "[S]earch [K]eymaps";
    };
    "<leader>sf" = {
      action = "find_files";
      options.desc = "[S]earch [F]iles";
    };
    "<leader>ss" = {
      action = "builtin";
      options.desc = "[s]earch [s]elect telescope";
    };
    "<leader>sw" = {
      action = "grep_string";
      options.desc = "[S]earch current [W]ord";
    };
    "<leader>sg" = {
      action = "live_grep";
      options.desc = "[S]earch by [G]rep";
    };
    "<leader>sd" = {
      action = "diagnostics";
      options.desc = "[S]earch [D]iagnostics";
    };
    "<leader>sr" = {
      action = "resume";
      options.desc = "[S]earch [R]esume";
    };
    "<leader>s." = {
      action = "oldfiles";
      options.desc = "[S]earch Recent Files ('.' for repeat)";
    };
    "<leader><leader>" = {
      action = "buffers";
      options.desc = "[ ] Find existing buffers";
    };
    "gd" = {
      action = "lsp_definitions";
      options.desc = "[G]oto [D]efinition";
    };
    "gr" = {
      action = "lsp_references";
      options.desc = "[G]oto [R]eferences";
    };
    "gI" = {
      action = "lsp_implementations";
      options.desc = "[G]oto [I]mplementation";
    };
    "<leader>D" = {
      action = "lsp_type_definitions";
      options.desc = "Type [D]efinition";
    };
    "<leader>ds" = {
      action = "lsp_document_symbols";
      options.desc = "[D]ocument [S]ymbols";
    };
    "<leader>ws" = {
      action = "lsp_dynamic_workspace_symbols";
      options.desc = "[W]orkspace [S]ymbols";
    };
  };
}
