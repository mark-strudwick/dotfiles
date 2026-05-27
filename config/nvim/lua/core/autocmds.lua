local api = vim.api

-- Don't auto comment new line
api.nvim_create_autocmd("BufEnter", { command = [[set formatoptions-=cro]] })

-- Highlight on yank
api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    vim.api.nvim_set_hl(0, "YankHighlight", { bg = "#F8C8DC", fg = "#000000" })
    vim.hl.on_yank({ higroup = "YankHighlight" })
  end,
})
-- Check for external file changes (works with Claude Code)
api.nvim_create_autocmd({ "FocusGained", "BufEnter" }, { -- CursorHold
  callback = function()
    if vim.fn.mode() ~= "c" then
      vim.cmd("checktime")
    end
  end,
})
