local catppuccin = require("catppuccin")

if not catppuccin then
	return
end

vim.g.catppuccin_flavour = "mocha"

catppuccin.setup({
  color_overrides = {
				mocha = {
					base = "#000000",
					mantle = "#000000",
					crust = "#000000",
				},
			},
			highlight_overrides = {
				mocha = function(C)
					return {
						TabLineSel = { bg = C.pink },
						CmpBorder = { fg = C.surface2 },
						Pmenu = { bg = C.none },
						TelescopeBorder = { link = "FloatBorder" },
					}
				end,
			},
})

vim.cmd([[colorscheme catppuccin]])
