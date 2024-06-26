return {
	{
		"stevearc/conform.nvim",
		cmd = {
			"ConformInfo",
		},
		keys = {
			{
				"<leader>fb",
				function()
					require("conform").format({ async = true, lsp_format = "fallback" })
				end,
				{
					desc = "[F]ormat [b]uffer",
				},
			},
		},
		opts = {
			formatters_by_ft = {
				lua = { "stylua" },
				go = { "goimports" },
			},
		},
	},
}
