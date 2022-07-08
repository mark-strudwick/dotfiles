local augroup = vim.api.nvim_create_augroup
MarkGroup = augroup('Mark', {})

require("mark.set")
require("mark.packer")
require("mark.neogit")

local autocmd = vim.api.nvim_create_autocmd
local yank_group = augroup('HighlightYank', {})

autocmd('TextYankPost', {
  group = yank_group,
  pattern = '*',
  callback = function()
      vim.highlight.on_yank({
          higroup = 'IncSearch',
          timeout = 40,
      })
  end,
})

require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'onedark',
    component_separators = '|',
    section_separators = '',
  },
}

require('gitsigns').setup()

require('Comment').setup()
