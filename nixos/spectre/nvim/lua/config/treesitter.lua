require("nvim-treesitter.configs").setup({
	auto_install = false,
	highlight = { enable = true },
	autopairs = { enable = true },
	rainbow = {
		enable = true,
		extended_mode = true,
	},
	textobjects = {
		select = {
			enable = true,
			lookahead = true,
			keymaps = {
				["af"] = "@function.outer",
				["if"] = "@function.inner",
				["ac"] = "@class.outer",
				["ic"] = "@class.inner",
				["aa"] = "@parameter.outer",
				["ia"] = "@parameter.inner",
				["as"] = "@statement.outer",
				["ib"] = "@block.inner",
				["ab"] = "@block.outer",
				["ak"] = "@comment.outer",
			},
		},
		swap = {
			enable = true,
			swap_next = {
				["<C-l>"] = "@parameter.inner",
				["<C-j>"] = "@statement.outer",
			},
			swap_previous = {
				["<C-h>"] = "@parameter.inner",
				["<C-k>"] = "@statement.outer",
			},
		},
		move = {
			enable = true,
			set_jumps = true,
			goto_next_start = {
				[")"] = "@block.outer",
			},
			goto_previous_start = {
				["("] = "@block.outer",
			},
		},
	},
})

-- Workaround for TS rainbow messed up after file changes
local group = vim.api.nvim_create_augroup("RainbowFix", { clear = true })
vim.api.nvim_create_autocmd({ "BufNewFile", "BufReadPost", "BufWritePost" }, {
	group = group,
	callback = function()
		vim.cmd("TSDisable rainbow | TSEnable rainbow")
	end,
})
