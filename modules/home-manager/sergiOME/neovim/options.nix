{home_dir}: {
  number = true;
  relativenumber = true;
  mouse = "a";
  showmode = false;
  clipboard = "unnamedplus";
  breakindent = true;

  swapfile = false;
  backup = false;
  undofile = true;
  undodir = "${home_dir}/.vim/undodir";

  ignorecase = true;
  smartcase = true;

  completeopt = "menuone,noselect";

  termguicolors = true;

  scrolloff = 10;
  signcolumn = "yes";

  updatetime = 250;
  timeoutlen = 300;

  splitright = true;
  splitbelow = true;

  list = true;
  listchars = {
    tab = "» ";
    trail = "·";
    nbsp = "␣";
  };

  inccommand = "split";

  cursorline = true;
  cursorcolumn = true;
  colorcolumn = "80";

  hlsearch = true;
}
