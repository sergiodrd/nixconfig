require("neodev").setup()

local lspconfig = require("lspconfig")
local cmp_nvim_lsp = require("cmp_nvim_lsp")

local keymap = vim.keymap
local opts = { noremap = true, silent = true }
local on_attach = function(client, bufnr)
	opts.buffer = bufnr

	opts.desc = "Show LSP references"
	keymap.set("n", "gr", "<cmd>Telescope lsp_references<CR>", opts)

	opts.desc = "Go to declaration"
	keymap.set("n", "gD", vim.lsp.buf.declaration, opts)

	opts.desc = "Show LSP definitions"
	keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts)

	opts.desc = "Show LSP implementations"
	keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts)

	opts.desc = "Smart rename"
	keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)

	opts.desc = "Code actions"
	keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)

	opts.desc = "Show buffer diagnostics"
	keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts)

	opts.desc = "Show line diagnostics"
	keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts)

	opts.desc = "Go to previous diagnostic"
	keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)

	opts.desc = "Go to next diagnostic"
	keymap.set("n", "]d", vim.diagnostic.goto_next, opts)

	opts.desc = "Hover"
	keymap.set("n", "K", vim.lsp.buf.hover, opts)

	opts.desc = "Restart LSP"
	keymap.set("n", "<leader>rs", "<cmd>LspRestart<CR>", opts)
end

local capabilities = cmp_nvim_lsp.default_capabilities()

local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

lspconfig["pyright"].setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

lspconfig["rust_analyzer"].setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

lspconfig["lua_ls"].setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

lspconfig["clangd"].setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

lspconfig["nil_ls"].setup({
	on_attach = on_attach,
	capabilities = capabilities,
})
