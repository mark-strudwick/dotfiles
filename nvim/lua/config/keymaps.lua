local opts = { noremap = true, silent = true }

local map = vim.keymap.set

map("n", "<leader><leader>", ":Telescope buffers<CR>", opts)

map("n", "<Leader>w", ":write!<CR>", opts)

-- Indent lines
map("v", "<", "<gv")
map("v", ">", ">gv")

-- copy everything between { and } including the brackets
map("n", "YY", "va{Vy", opts)

-- Navigate buffers with shift + h/l
map("n", "<S-l>", ":bnext<CR>", opts)
map("n", "<S-h>", ":bprevious<CR>", opts)
