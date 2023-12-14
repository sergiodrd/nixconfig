vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
local indent_map = {
	nix = { tabstop = 2, shiftwidth = 2, expandtab = true },
	json = { tabstop = 2, shiftwidth = 2, expandtab = true },
	javascript = { tabstop = 2, shiftwidth = 2, expandtab = true },
	markdown = { tabstop = 2, shiftwidth = 2, expandtab = true },
	html = { tabstop = 2, shiftwidth = 2, expandtab = true },
}
local group = vim.api.nvim_create_augroup("MyCustomIndents", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
	pattern = vim.tbl_keys(indent_map),
	group = group,
	callback = function()
		local match = vim.fn.expand("<amatch>")
		for opt, val in pairs(indent_map[match]) do
			vim.api.nvim_set_option_value(opt, val, { scope = "local" })
		end
	end,
})

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.o.completeopt = 'menuone,noselect'

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.o.termguicolors = true

vim.opt.colorcolumn = "80"
