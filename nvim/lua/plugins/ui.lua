return {
	{
		"nvim-lualine/lualine.nvim",
		event = "UiEnter",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		opts = {
			options = {
				theme = "catppuccin",
			},
			sections = {
				lualine_x = {},
			},
		},
	},
}

