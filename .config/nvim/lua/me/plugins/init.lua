local user_plugins = {
	-- Core
	{
		"tpope/vim-fugitive",
		config = function()
			vim.keymap.set("n", "<Leader>g", "<Cmd>Git<CR>", { desc = "Git status" })
		end,
	},
	"tpope/vim-surround",
	"tpope/vim-commentary",
	"tpope/vim-repeat",
	"tpope/vim-rhubarb",
	"janko/vim-test",
	"jiangmiao/auto-pairs",
	"mattn/emmet-vim",
	"kevinhwang91/nvim-bqf",
	{
		"mbbill/undotree",
		config = function()
			vim.keymap.set("n", "<Leader>u", vim.cmd.UndotreeToggle, { desc = "Open undo tree" })
		end,
	},

	{
		"nvim-tree/nvim-tree.lua",
		requires = {
			"nvim-tree/nvim-web-devicons", -- optional, for file icons
		},
		config = function()
			require("me.plugins.configs.nvimtree")
		end,
	},

	-- Telescope
	{
		"nvim-lua/telescope.nvim",
		branch = "0.1.x",
		requires = "nvim-lua/plenary.nvim",
		config = function()
			require("me.plugins.configs.telescope")
		end,
	},

    {
	  "VonHeikemen/lsp-zero.nvim",
	  branch = 'v1.x',
	  requires = {
		  -- LSP Support
		  {'neovim/nvim-lspconfig'},
		  {'williamboman/mason.nvim'},
		  {'williamboman/mason-lspconfig.nvim'},

		  -- Autocompletion
		  {'hrsh7th/nvim-cmp'},
		  {'hrsh7th/cmp-buffer'},
		  {'hrsh7th/cmp-path'},
		  {'saadparwaiz1/cmp_luasnip'},
		  {'hrsh7th/cmp-nvim-lsp'},
		  {'hrsh7th/cmp-nvim-lua'},

		  -- Snippets
		  {'L3MON4D3/LuaSnip'},
		  {'rafamadriz/friendly-snippets'},
	  },
    config = function()
			require("me.plugins.configs.lspconfig")
		end,

    },
	-- -- LSP
	-- {
	-- 	"neovim/nvim-lspconfig",
	-- 	requires = {
	-- 		-- Linter/Formatter
	-- 		"creativenull/diagnosticls-configs-nvim",
	-- 		-- Tool installer
	-- 		"williamboman/mason.nvim",
	-- 		"williamboman/mason-lspconfig.nvim",
	-- 		"WhoIsSethDaniel/mason-tool-installer.nvim",
	-- 		-- UI/Aesthetics
	-- 		"glepnir/lspsaga.nvim",
	-- 	},
	-- 	config = function()
	-- 		-- require("lspsaga").init_lsp_saga({ border_style = "rounded" })
	-- 		require("mason").setup()
	-- 		require("me.plugins.configs.lspconfig")
	-- 	end,
	-- },

	-- -- Autocompletion and Snippets
	-- {
	-- 	"hrsh7th/nvim-cmp",
	-- 	requires = {
	-- 		-- Cmdline completions
	-- 		"hrsh7th/cmp-cmdline",
	-- 		-- Path completions
	-- 		"hrsh7th/cmp-path",
	-- 		-- Buffer completions
	-- 		"hrsh7th/cmp-buffer",
	-- 		-- LSP completions
	-- 		"hrsh7th/cmp-nvim-lsp",
	-- 		"onsails/lspkind-nvim",
	-- 		-- vnsip completions
	-- 		"hrsh7th/cmp-vsnip",
	-- 		"hrsh7th/vim-vsnip",
	-- 		"rafamadriz/friendly-snippets",
	-- 	},
	-- 	config = function()
	-- 		require("me.plugins.configs.cmp")
	-- 	end,
	-- },

    -- Whichkey
	{
		"folke/which-key.nvim",
		config = function()
                require("me.plugins.configs.which-key")
		end,
	},

	-- Treesitter
	{
		"nvim-treesitter/nvim-treesitter",
		run = function()
			require("nvim-treesitter.install").update({ with_sync = true })
		end,
		config = function()
			require("me.plugins.configs.treesitter")
		end,
	},

	-- Theme/Syntax
	{ "catppuccin/nvim", as = "catppuccin" },
	-- {
	-- 	"akinsho/bufferline.nvim",
	-- 	requires = "nvim-tree/nvim-web-devicons",
	-- 	config = function()
	-- 		require("me.plugins.configs.bufferline")
	-- 	end,
	-- },
	{
		"nvim-lualine/lualine.nvim",
		requires = "nvim-tree/nvim-web-devicons",
		config = function()
			require("me.plugins.configs.lualine")
		end,
	},
	"princejoogie/tailwind-highlight.nvim",

	"github/copilot.vim",
}

-- Plugin Setup
-- ============
local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
		vim.cmd([[packadd packer.nvim]])
		return true
	end
	return false
end

local packer_bootstrap = ensure_packer()

require("packer").init({
	compile_path = string.format("%s/site/plugin/packer_compiled.lua", vim.fn.stdpath("data")),
	display = {
		prompt_border = "rounded",
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

require("packer").startup(function(use)
	use("wbthomason/packer.nvim")

	-- My plugins here
	for _, user_plugin in pairs(user_plugins) do
		use(user_plugin)
	end

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if packer_bootstrap then
		require("packer").sync()
	end
end)
