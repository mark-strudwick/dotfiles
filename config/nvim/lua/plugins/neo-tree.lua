return {
    {
        'nvim-neo-tree/neo-tree.nvim',
        event = 'VeryLazy',
	dependencies = {
	  "nvim-lua/plenary.nvim",
	  "MunifTanjim/nui.nvim",
	  "nvim-tree/nvim-web-devicons", -- optional, but recommended
	},
	keys = {
	  { "<leader>e", ":Neotree toggle float<CR>", silent = true, desc = "Float file explorer" },
	},
	config = function()
	  require("neo-tree").setup({
	      -- Configuration here, or leave empty to use defaults
	  })
	end
    },
}
