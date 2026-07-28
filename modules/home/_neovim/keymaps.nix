[
  # base keymaps
  {
    mode = "i";
    key = "<C-c>";
    action = "<Esc>";
  }
  {
    mode = "n";
    key = "<C-c>";
    action = "<cmd>nohlsearch<CR>";
  }

  {
    mode = "n";
    key = "-";
    action = ":Oil<CR>";
  }

  {
    mode = "v";
    key = "J";
    action = ":m '>+1<CR>gv=gv";
  }
  {
    mode = "v";
    key = "K";
    action = ":m '<-2<CR>gv=gv";
  }

  {
    mode = "n";
    key = "J";
    action = "mzJ`z";
  }
  {
    mode = "n";
    key = "<C-d>";
    action = "<C-d>zz";
  }
  {
    mode = "n";
    key = "<C-u>";
    action = "<C-u>zz";
  }
  {
    mode = "n";
    key = "n";
    action = "nzzzv";
  }
  {
    mode = "n";
    key = "N";
    action = "Nzzzv";
  }

  {
    mode = "n";
    key = "<leader>f";
    action = {__raw = "vim.lsp.buf.format";};
  }

  {
    mode = "n";
    key = "<C-k>";
    action = "<cmd>cnext<CR>zz";
  }
  {
    mode = "n";
    key = "<C-j>";
    action = "<cmd>cprev<CR>zz";
  }

  {
    mode = "n";
    key = "<leader>S";
    action = ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>";
  }
  {
    mode = "n";
    key = "<leader>x";
    action = "<cmd>!chmod +x %<CR>";
    options.silent = true;
  }

  # diagnostic keymaps
  {
    mode = "n";
    key = "[d";
    action = {__raw = "vim.diagnostic.goto_prev";};
    options.desc = "Go to previous [D]iagnostic message";
  }
  {
    mode = "n";
    key = "]d";
    action = {__raw = "vim.diagnostic.goto_next";};
    options.desc = "Go to next [D]iagnostic message";
  }
  {
    mode = "n";
    key = "<leader>e";
    action = {__raw = "vim.diagnostic.open_float";};
    options.desc = "Show diagnostic [E]rror messages";
  }
  {
    mode = "n";
    key = "<leader>q";
    action = {__raw = "vim.diagnostic.setloclist";};
    options.desc = "Open diagnostic [Q]uickfix list";
  }

  # disable arrow keys in normal mode
  {
    mode = "n";
    key = "<left>";
    action = "<cmd>echo 'Use h to move!!<CR>";
  }
  {
    mode = "n";
    key = "<right>";
    action = "<cmd>echo 'Use l to move!!<CR>";
  }
  {
    mode = "n";
    key = "<up>";
    action = "<cmd>echo 'Use k to move!!<CR>";
  }
  {
    mode = "n";
    key = "<down>";
    action = "<cmd>echo 'Use j to move!!<CR>";
  }

  # split navigation
  {
    mode = "n";
    key = "<C-h>";
    action = "<C-w><C-h>";
    options.desc = "Move focus to the left window";
  }
  {
    mode = "n";
    key = "<c-l>";
    action = "<c-w><c-l>";
    options.desc = "move focus to the right window";
  }
  {
    mode = "n";
    key = "<c-j>";
    action = "<c-w><c-j>";
    options.desc = "move focus to the lower window";
  }
  {
    mode = "n";
    key = "<c-k>";
    action = "<c-w><c-k>";
    options.desc = "move focus to the upper window";
  }

  # harpoon
  {
    mode = "n";
    key = "<leader>a";
    action.__raw = "function() require'harpoon':list():add() end";
  }
  {
    mode = "n";
    key = "<C-e>";
    action.__raw = "function() require'harpoon'.ui:toggle_quick_menu(require'harpoon':list()) end";
  }
  {
    mode = "n";
    key = "<leader>j";
    action.__raw = "function() require'harpoon':list():select(1) end";
  }
  {
    mode = "n";
    key = "<leader>k";
    action.__raw = "function() require'harpoon':list():select(2) end";
  }
  {
    mode = "n";
    key = "<leader>l";
    action.__raw = "function() require'harpoon':list():select(3) end";
  }
  {
    mode = "n";
    key = "<leader>;";
    action.__raw = "function() require'harpoon':list():select(4) end";
  }
]
