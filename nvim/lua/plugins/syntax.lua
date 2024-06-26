return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
	},

	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		event = "BufReadPost",
		dependencies = {
			"nvim-treesitter/nvim-treesitter-textobjects",
		},
		config = function()
			require("nvim-treesitter.configs").setup({
				auto_install = true,
				ensure_installed = {
					"lua",
					"markdown",
					"markdown_inline",
					"query",
					"vim",
					"vimdoc",
				},
				highlight = {
					enable = true,
					additional_vim_regex_highlighting = false,
				},
				indent = {
					enable = true,
				},
				textobjects = {
					select = {
						enable = true,
						lookahead = true,
						keymaps = {
							["if"] = "@function.inner",
							["af"] = "@function.outer",
							["ib"] = "@block.inner",
							["ab"] = "@block.outer",
						},
					},
					move = {
						enable = true,
						set_jumps = true,
						goto_next = {
							["]f"] = "@function.outer",
						},
						goto_previous = {
							["[f"] = "@function.outer",
						},
					},
				},
			})
		end,
	},
}

