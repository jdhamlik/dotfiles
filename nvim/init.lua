-- Prepend mise shims to PATH
vim.env.PATH = vim.env.HOME .. "/.local/share/mise/shims:" .. vim.env.PATH

vim.loader.enable()

vim.g.loaded_node_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_python3_provider = 0
vim.g.loaded_ruby_provider = 0

vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.o.number = true

vim.o.tabstop = 4
vim.o.shiftwidth = 4

vim.o.mouse = "a"
vim.o.clipboard = "unnamedplus"

vim.o.showmode = false
vim.o.cursorline = true
vim.o.signcolumn = "yes"

vim.o.scrolloff = 6

vim.o.undofile = true

vim.o.ignorecase = true
vim.o.smartcase = true

vim.o.updatetime = 250

vim.o.splitright = true
vim.o.splitbelow = true

vim.o.inccommand = "split"

vim.o.hlsearch = true

vim.keymap.set("n", "<esc>", "<cmd>nohlsearch<cr>")

vim.filetype.add({ extension = { templ = "templ" } })

vim.keymap.set("n", "<A-K>", "<cmd>m .-2<cr>==")
vim.keymap.set("n", "<A-J>", "<cmd>m .+1<cr>==")

-- Required for Obsidian.
vim.o.conceallevel = 2

vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("LspConfig", { clear = true }),
	callback = function(ev)
		vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

		local opts = { buffer = ev.buf }
		vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
		vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)

		local telescope = require("telescope.builtin")

		vim.keymap.set("n", "gd", telescope.lsp_definitions, opts)
		vim.keymap.set("n", "gr", telescope.lsp_references, opts)

		vim.keymap.set("n", "<leader>ws", telescope.lsp_workspace_symbols, opts)
	end,
})

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

local lazy = require("lazy")

vim.keymap.set("n", "<leader>pm", lazy.home)
vim.keymap.set("n", "<leader>pu", lazy.update)

lazy.setup("plugins", {
	defaults = {
		lazy = true,
	},
	concurrency = 24,
	install = {
		colorscheme = { "catppuccin" },
	},
	change_detection = {
		enabled = false,
	},
	performance = {
		rtp = {
			disabled_plugins = {
				"gzip",
				"man",
				"matchit",
				"matchparen",
				"netrwPlugin",
				"osc52",
				"rplugin",
				"shada",
				"spellfile",
				"tarPlugin",
				"tohtml",
				"tutor",
				"zipPlugin",
			},
		},
	},
})

vim.cmd[[colorscheme catppuccin]]
