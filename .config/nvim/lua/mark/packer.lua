return require("packer").startup(function()
	use("wbthomason/packer.nvim")

	use("TimUntersberger/neogit")

	use("nvim-lua/plenary.nvim")
  use("nvim-lua/popup.nvim")
  use("nvim-telescope/telescope.nvim")

  use("neovim/nvim-lspconfig")
  use('nvim-lualine/lualine.nvim')
  use('lewis6991/gitsigns.nvim')

  use("nvim-treesitter/nvim-treesitter", {
    run = ":TSUpdate"
  })

  use('joshdick/onedark.vim')
  use('kyazdani42/nvim-web-devicons')

  use('lukas-reineke/indent-blankline.nvim')
  use('jiangmiao/auto-pairs')
  use('numToStr/Comment.nvim')
  use('tpope/vim-sleuth')
end)
