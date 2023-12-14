vim.opt.termguicolors = true
vim.cmd [[highlight IndentBlanklineIndent1 guibg=#232136 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent2 guibg=#2a283e gui=nocombine]]

require("indent_blankline").setup {
    char = "",
    char_highlight_list = {
        "IndentBlanklineIndent1",
        "IndentBlanklineIndent2",
    },
    space_char_highlight_list = {
        "IndentBlanklineIndent1",
        "IndentBlanklineIndent2",
    },
    show_trailing_blankline_indent = false,
}
