return require("packer").startup(function()
  use("wbthomason/packer.nvim")

  use("TimUntersberger/neogit")

  use("nvim-lua/plenary.nvim")
  use("nvim-lua/popup.nvim")
  use("nvim-telescope/telescope.nvim")

  -- Fuzzy Finder Algorithm which requires local dependencies to be built. Only load if `make` is available
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make', cond = vim.fn.executable "make" == 1 }

  use("neovim/nvim-lspconfig")
  use('nvim-lualine/lualine.nvim')
  use('lewis6991/gitsigns.nvim')

  use("nvim-treesitter/nvim-treesitter", {
    run = ":TSUpdate"
  })

  use('joshdick/onedark.vim')
  use('kyazdani42/nvim-web-devicons')
  use('kyazdani42/nvim-tree.lua')

  use('lukas-reineke/indent-blankline.nvim')
  use('jiangmiao/auto-pairs')
  use('numToStr/Comment.nvim')
  use('tpope/vim-sleuth')

end)
