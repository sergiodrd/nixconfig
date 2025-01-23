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
]
