return {
	{
		"stevearc/oil.nvim",
		cmd = "Oil",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		keys = {
			{
				"-",
				function()
					require("oil").open_float()
				end,
				desc = "Open file manager",
			},
		},
		opts = {
			skip_confirm_for_simple_edits = true,
		},
	},

	{
		"nvim-telescope/telescope.nvim",
		cmd = "Telescope",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",

			{
				"nvim-telescope/telescope-fzf-native.nvim",
				build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
			},
		},
		keys = {
			{
				"<leader>sa",
				function()
					require("telescope.builtin").find_files({ hidden = true, no_ignore = true })
				end,
				desc = "[S]earch [a]ll files",
			},
			{
				"<leader>sd",
				function()
					require("telescope.builtin").lsp_document_symbols()
				end,
				desc = "[S]earch [d]ocument symbols",
			},
			{
				"<leader>sf",
				function()
					require("telescope.builtin").find_files()
				end,
				desc = "[S]earch [f]iles",
			},
			{
				"<leader>sh",
				function()
					require("telescope.builtin").help_tags()
				end,
				desc = "[S]earch [h]elp tags",
			},
			{
				"<leader>sl",
				function()
					require("telescope.builtin").live_grep()
				end,
				desc = "[S]earch with [l]ive grep",
			},
			{
				"<leader>sr",
				function()
					require("telescope.builtin").registers()
				end,
				desc = "[S]earch [r]egisters",
			},
			{
				"<leader>ss",
				function()
					require("telescope.builtin").resume()
				end,
				desc = "[S]earch resume",
			},
			{
				"<leader>sw",
				function()
					require("telescope.builtin").lsp_dynamic_workspace_symbols()
				end,
				desc = "[S]earch [w]orkspace symbols",
			},
			{
				"<leader>sy",
				function()
					require("telescope").extensions.yank_history.yank_history()
				end,
				desc = "[S]earch [y]anks",
			},

			{
				"<leader>sgb",
				function()
					require("telescope.builtin").git_branches()
				end,
				desc = "[S]earch [G]it [b]ranches",
			},
			{
				"<leader>sgs",
				function()
					require("telescope.builtin").git_stash()
				end,
				desc = "[S]earch [G]it [s]tashes",
			},
		},
		config = function()
			local telescope = require("telescope")

			telescope.setup({})
			telescope.load_extension("fzf")
			telescope.load_extension("yank_history")
		end,
	},

	{
		"folke/flash.nvim",
		event = "CmdlineEnter",
		keys = {
			-- { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
			-- { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
		},
		opts = {
			modes = {
				search = {
					enabled = true,
					highlight = {
						backdrop = true,
					},
				},
			},
		},
	},

	{
		"folke/trouble.nvim",
		cmd = "Trouble",
		keys = {
			{
				"<leader>xx",
				function()
					require("trouble").toggle({ mode = "diagnostics" })
				end,
			},
			{ "<leader>xX", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>" },
			{
				"<leader>xt",
				function()
					require("trouble").toggle({ mode = "todo" })
				end,
			},
		},
		opts = {},
	},

	{
		"folke/todo-comments.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		event = "BufReadPost",
		cmd = {
			"TodoQuickFix",
			"TodoLocList",
		},
		keys = {
			{ "st", "<cmd>TodoTelescope<cr>" },
		},
		opts = {},
	},
}
