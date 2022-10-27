local M = {}

local function init()
	-- Enable provider for only python3 and node
	vim.g.python3_host_prog = vim.fn.exepath("python3")
	vim.g.loaded_python_provider = 0

	vim.g["test#strategy"] = "neovim"
	vim.g["test#neovim#term_position"] = "vertical"
	vim.g["test#javascript#jest#options"] = "--watch"
end

function M.setup()
	init()

	require("me.autocmds")
	require("me.keymaps")
	require("me.options")
	require("me.plugins")
	require("me.colorscheme")
end

return M
