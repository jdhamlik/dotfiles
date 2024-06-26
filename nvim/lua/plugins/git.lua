return {
	{
		"lewis6991/gitsigns.nvim",
		event = "BufReadPost",
		opts = {},
	},

	{
		"NeogitOrg/neogit",
		branch = "master",
		cmd = "Neogit",
		keys = {
			{ "<leader>gs", function() require("neogit").open() end },
		},
		dependencies = {
			"nvim-lua/plenary.nvim",
			"sindrets/diffview.nvim",
			"nvim-telescope/telescope.nvim",
		},
		opts = {}
	},
}
