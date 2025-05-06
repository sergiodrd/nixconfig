[
  {
    desc = "Highlight when yanking (copying) text";
    group = "highlight_yank";
    event = "TextYankPost";
    callback = {
      __raw = ''
        function()
          vim.highlight.on_yank()
        end
      '';
    };
  }

  {
    desc = "Alias blade.php files to php files";
    group = "blade_alias";
    event = ["BufRead" "BufNewFile"];
    pattern = "*.blade.php";
    command = "setfiletype php";
  }
]
