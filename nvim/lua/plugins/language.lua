return {
	{
		"neovim/nvim-lspconfig",
		event = "BufReadPost",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
		},
		config = function()
			local lsp = require("lspconfig")

			local capabilities = vim.lsp.protocol.make_client_capabilities()
			capabilities = vim.tbl_deep_extend('force', capabilities, require("cmp_nvim_lsp").default_capabilities())

			local opts = {
				capabilities = capabilities,
			}

			lsp.clangd.setup({
				cmd = {
					"/opt/homebrew/opt/llvm/bin/clangd"
				},
				capabilities = capabilities,
			})

			-- Set up standard LSPs.
			lsp.gopls.setup(opts)
			lsp.lua_ls.setup(opts)
		end,
	},

	-- Lua
	{
		"folke/lazydev.nvim",
		ft = "lua", -- only load on lua files
		opts = {
			library = {
				-- See the configuration section for more details
				-- Load luvit types when the `vim.uv` word is found
				{ path = "luvit-meta/library", words = { "vim%.uv" } },
			},
		},
	},
	{ "Bilal2453/luvit-meta" },
}
