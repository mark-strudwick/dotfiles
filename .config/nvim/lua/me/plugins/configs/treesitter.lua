require("nvim-treesitter.configs").setup({
	ensure_installed = {
		"help", "javascript", "typescript", "lua", "rust"
	},
	highlight = { enable = true, additional_vim_regex_highlighting = false },
})
