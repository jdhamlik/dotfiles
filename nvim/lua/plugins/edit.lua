return {
	{
		"nmac427/guess-indent.nvim",
		event = "BufReadPre",
		cmd = "GuessIndent",
		opts = {},
	},

	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		opts = {},
	},

	{
		"kylechui/nvim-surround",
		keys = { "cs", "ds", "ys" },
		opts = {},
	},

	{
		"gbprod/substitute.nvim",
		keys = {
			{
				"s",
				function()
					require("substitute").operator()
				end,
			},
			{
				"ss",
				function()
					require("substitute").line()
				end,
			},
			{
				"S",
				function()
					require("substitute").visual()
				end,
				mode = { "x" },
			},
			{
				"sx",
				function()
					require("substitute.exchange").operator()
				end,
			},
			{
				"sxx",
				function()
					require("substitute.exchange").line()
				end,
			},
			{
				"X",
				function()
					require("substitute.exchange").visual()
				end,
				mode = { "x" },
			},
		},
		config = function()
			require("substitute").setup({
				on_substitute = require("yanky.integration").substitute(),
			})
		end,
	},

	{
		"gbprod/yanky.nvim",
		keys = {
			{
				"p",
				function()
					local yanky = require("yanky")
					yanky.put(yanky.type.PUT_INDENT_AFTER)
				end,
			},
			{
				"P",
				function()
					local yanky = require("yanky")
					yanky.put(yanky.type.PUT_INDENT_BEFORE)
				end,
			},
			{
				"]p",
				function()
					local yanky = require("yanky")
					yanky.put(yanky.type.PUT_INDENT_AFTER)
				end,
			},
			{
				"<c-p>",
				function()
					local yanky = require("yanky")
					yanky.cycle(yanky.direction.BACKWARD)
				end,
			},
			{
				"<c-n>",
				function()
					local yanky = require("yanky")
					yanky.cycle(yanky.direction.FORWARD)
				end,
			},
		},
		opts = {
			highlight = {
				on_put = true,
				on_yank = true,
				timer = 200,
			},
		},
	},
}
