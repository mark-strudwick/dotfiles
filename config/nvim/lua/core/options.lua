-- Leader Keys
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Disable Built-in Plugins
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Disable Providers
vim.g.loaded_node_provider = 0    -- Disable Node.js provider
vim.g.loaded_perl_provider = 0    -- Disable Perl provider
vim.g.loaded_python3_provider = 0 -- Disable Python 3 provider
vim.g.loaded_ruby_provider = 0    -- Disable Ruby provider

-- Editor
vim.opt.mouse = "a"
vim.opt.clipboard = "unnamed,unnamedplus"
vim.opt.undofile = true
vim.opt.undodir = vim.fn.stdpath("data") .. "/undo"
vim.opt.updatetime = 100
vim.opt.timeoutlen = 1000
vim.opt.confirm = true
vim.opt.autoread = true

-- UI
vim.opt.termguicolors = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.numberwidth = 4
vim.opt.signcolumn = "yes:1"
vim.opt.cursorline = false
vim.opt.scrolloff = 9
vim.opt.wrap = false
vim.opt.breakindent = false
vim.opt.showmode = false
vim.opt.showcmd = false
vim.opt.ruler = false
vim.opt.showtabline = 0 
vim.opt.cmdheight = 1
vim.opt.pumheight = 10
vim.opt.fillchars = { eob = " " }
vim.opt.winborder = "rounded"

-- Search
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Indentation
vim.opt.expandtab = false
vim.opt.shiftwidth = 2
vim.opt.smartindent = true

-- Splits
vim.opt.splitbelow = true
vim.opt.splitright = true

-- Files
vim.opt.fileencoding = "utf-8"
vim.opt.backup = false
vim.opt.writebackup = false -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
vim.opt.swapfile = false

-- Completion
vim.opt.completeopt = { "menu", "menuone", "noselect" }
vim.opt.conceallevel = 0

-- Other
vim.opt.title = true
vim.opt.guifont = "monospace:h17"
