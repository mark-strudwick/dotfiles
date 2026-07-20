return {
  { "nvim-tree/nvim-web-devicons", lazy = true },
  {
    "nvim-lualine/lualine.nvim",
    -- lazy = true,
    config = function()
      local function truncate_branch_name(branch)
	if not branch or branch == "" then
		return ""
	end
	-- TODO: If branches use a format like "fix/plat-<ticket-number>" then maybe extract ticket number
	return branch
      end

      require("lualine").setup({
      options = {
	theme = "catppuccin-mocha",
	globalstatus = true,
	component_separators = { left = "", right = "" },
	section_separators = { left = "█", right = "█" },
      },
      sections = {
	lualine_b = {
	  { "branch", icon = "", fmt = truncate_branch_name },
	  "diff",
	  "diagnostics",
	},
	lualine_c = {
	  { "filename", path = 1 },
	},
	lualine_x = {
	  "filetype",
	},
      },
      })
  end,
  },
}
