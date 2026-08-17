local function setup_keymaps(bufnr)
  local function map(mode, lhs, rhs, desc)
    vim.keymap.set(mode, lhs, rhs, { buf = bufnr, desc = desc, silent = true })
  end

  -- gd, gD, gr, gi, gy handled by Snacks picker (snacks.lua)

  -- Diagnostics navigation
  map("n", "[d", function() vim.diagnostic.jump({ count = -1 }) end, "Prev Diagnostic")
  map("n", "]d", function() vim.diagnostic.jump({ count = 1 }) end, "Next Diagnostic")

  -- <leader>c = Code
  map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, "Code Action")
  map("n", "<leader>cd", vim.diagnostic.open_float, "Line Diagnostic")

  -- <leader>l = LSP (using native :lsp command from 0.12)
  map("n", "<leader>lr", "<cmd>lsp restart<cr>", "LSP Restart")
  map("n", "<leader>lh", function()
    vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = bufnr }), { bufnr = bufnr })
  end, "Toggle Inlay Hints")
end

vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("UserLspConfig", { clear = true }),
  callback = function(args)
    local bufnr = args.buf

    setup_keymaps(bufnr)
  end
})

return {
  {
    'nvim-treesitter/nvim-treesitter',
    lazy = false,
    branch = "main",
    build = ":TSUpdate",
    init = function()
      require('nvim-treesitter').install({ 'python', 'javascript', 'typescript', 'jsx', 'tsx', 'go', 'rust', 'html', 'css', 'lua', 'vim' })
    end,
  },
  {
    "mason-org/mason.nvim",
    lazy = false,
    opts = {},
  },
  {
    "mason-org/mason-lspconfig.nvim",
    lazy = false,
    dependencies = { "mason-org/mason.nvim", "neovim/nvim-lspconfig", },
    opts = {},
  },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    lazy = false,
    dependencies = { "mason-org/mason.nvim", "mason-org/mason-lspconfig.nvim", },
    opts = {
      ensure_installed = {
        "eslint_d", "lua-language-server", "golangci-lint", "dockerfile-language-server",
	"typescript-language-server", "yaml-language-server",
	"rust-analyzer",
        "ruff", "ty",
	"luacheck",
        -- Formatters
        "stylua", "prettier", "yamllint"
      },
    },
  },
}
