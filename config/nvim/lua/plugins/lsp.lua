return {
  {
    "neovim/nvim-lspconfig",
    lazy = false,
  },
  {
    "mason-org/mason.nvim",
    lazy = false,
  },
  {
    "mason-org/mason-lspconfig.nvim",
    lazy = false,
    dependencies = { "mason-org/mason.nvim", "neovim/nvim-lspconfig", },
  },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    lazy = false,
    dependencies = { "mason-org/mason.nvim", "mason-org/mason-lspconfig.nvim", },
    opts = {
      ensure_installed = {
        "eslint_d", "lua-language-server", "golangci-lint", "dockerfile-language-server",
	"typescript-language-server", "yaml-language-server",
        "ruff", "ty",
        -- Formatters
        "stylua", "prettier",
      },
    },
  },
}
