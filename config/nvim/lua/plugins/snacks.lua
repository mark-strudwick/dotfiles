return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  opts = {
    animate = { enabled = false },
    bigfile = { enabled = true },
    bufdelete = { enabled = false },
    dashboard = { enabled = true },
    debug = { enabled = false },
    dim = { enabled = false },
    explorer = { enabled = true },
    gh = { enabled = false },
    git = { enabled = false },
    gitbrowse = { enabled = false },
    -- Requires the Kitty Graphics Protocol
    image = {
      enabled = false,
      doc = {
        enabled = true,
        inline = true,
        float = true,
        max_width = 80,
        max_height = 40,
      },
    },
    indent = { enabled = false },
    input = { enabled = true },
    keymap = { enabled = false },
    layout = { enabled = false },
    lazygit = { enabled = true },
    notifier = { enabled = true, timeout = 3000 },
    picker = {
      enabled = true,
      sources = {
        files = { hidden = true },
        explorer = { hidden = true, auto_close = false },
      },
    },
    profiler = { enabled = false },
    quickfile = { enabled = true },
    rename = { enabled = false },
    scope = { enabled = true },
    scratch = { enabled = false },
    scroll = { enabled = false },
    statuscolumn = { enabled = true },
    terminal = { enabled = false },
    toggle = { enabled = false },
    win = { enabled = false },
    words = { enabled = true },
    zen = { enabled = false },
  },
  keys = {
    -- Top-level (most used - quick access)
    { "<leader>e", function() Snacks.explorer() end, desc = "Explorer" },

    -- Word navigation (LSP references)
    { "]]", function() Snacks.words.jump(vim.v.count1) end, desc = "Next Reference", mode = { "n", "t" } },
    { "[[", function() Snacks.words.jump(-vim.v.count1) end, desc = "Prev Reference", mode = { "n", "t" } },

    -- <Leader>f (Files)
    { "<leader>ff", function() Snacks.picker.files() end, desc = "Find Files" },
    { "<leader>fw", function() Snacks.picker.grep() end, desc = "Grep" },
    { "<leader>fc", function() Snacks.picker.files({ cwd = vim.fn.stdpath("config") }) end, desc = "Config Files" },

    -- <leader>g (Git)
    { "<leader>gg", function() Snacks.lazygit() end, desc = "Lazygit" },

    -- <leader>n (Notifications)
    { "<leader>nn", function() Snacks.notifier.show_history() end, desc = "Notification History" },

    -- g = Goto (LSP navigation via Snacks picker)
    { "gd", function() Snacks.picker.lsp_definitions() end, desc = "Definition" },
    { "gD", function() Snacks.picker.lsp_declarations() end, desc = "Declaration" },
    { "gr", function() Snacks.picker.lsp_references() end, nowait = true, desc = "References" },
    { "gi", function() Snacks.picker.lsp_implementations() end, desc = "Implementation" },
    { "gy", function() Snacks.picker.lsp_type_definitions() end, desc = "Type Definition" },
  }
}
