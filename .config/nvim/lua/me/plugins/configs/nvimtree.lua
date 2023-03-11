require("nvim-tree").setup()

vim.keymap.set("n", "<Leader>ft", ":NvimTreeToggle<CR>", { desc = "Open file tree" })
