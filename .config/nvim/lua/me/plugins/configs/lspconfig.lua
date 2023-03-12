local lsp = require("lsp-zero")

lsp.preset("recommended")

lsp.ensure_installed({
	"tsserver",
	"rust_analyzer",
})

-- Fix Undefined global 'vim'
lsp.configure("lua-language-server", {
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" },
			},
		},
	},
})

local cmp = require("cmp")
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
	["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
	["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
	["<C-y>"] = cmp.mapping.confirm({ select = true }),
	["<C-Space>"] = cmp.mapping.complete(),
})

cmp_mappings["<Tab>"] = nil
cmp_mappings["<S-Tab>"] = nil

lsp.setup_nvim_cmp({
	mapping = cmp_mappings,
})

lsp.set_preferences({
	suggest_lsp_servers = false,
	sign_icons = {
		error = "E",
		warn = "W",
		hint = "H",
		info = "I",
	},
})

local diag_opts = { noremap=true, silent=true }
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, diag_opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, diag_opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, diag_opts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, diag_opts)

lsp.on_attach(function(client, bufnr)
	vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition [LSP]", buffer = bufnr })
	vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { desc = "Go to declaration [LSP]", buffer = bufnr })
	vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Hover [LSP]", buffer = bufnr })
	vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { desc = "Go to implentation [LSP]", buffer = bufnr })
	vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, { desc = "Show signature help [LSP]", buffer = bufnr })
	vim.keymap.set(
		"n",
		"<space>wa",
		vim.lsp.buf.add_workspace_folder,
		{ desc = "Add Workspace Folder [LSP]", buffer = bufnr }
	)
	vim.keymap.set(
		"n",
		"<space>wr",
		vim.lsp.buf.remove_workspace_folder,
		{ desc = "Remove workspace folder", buffer = bufnr }
	)
	vim.keymap.set("n", "<space>wl", function()
		print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
	end, { desc = "List workspace folders [LSP]", buffer = bufnr })
	vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, { desc = "Type definition [LSP]", buffer = bufnr })
	vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, { desc = "Buffer rename [LSP]", buffer = bufnr })
	vim.keymap.set("n", "<space>ca", vim.lsp.buf.code_action, { desc = "Code action [LSP]", buffer = bufnr })
	vim.keymap.set("n", "gr", vim.lsp.buf.references, { desc = "Buffer references [LSP]", buffer = bufnr })
	vim.keymap.set("n", "<space>f", function()
		vim.lsp.buf.format({ async = true })
	end, { desc = "Buffer format [LSP]", buffer = bufnr })
end)

lsp.setup()

vim.diagnostic.config({
	virtual_text = true,
})

-- local lspconfig = require("lspconfig")

-- -- Global diagnostic config
-- vim.diagnostic.config({
-- 	underline = { severity_limit = "Error" },
-- 	signs = true,
-- 	update_in_insert = false,
-- })

-- local function on_attach(client, bufnr)
-- 	vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition [LSP]", buffer = bufnr })
-- 	vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, { desc = "Go to type definition", buffer = bufnr })
-- 	vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { desc = "Go to declaration [LSP]", buffer = bufnr })
-- 	vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { desc = "Go to implentation [LSP]", buffer = bufnr })
-- 	vim.keymap.set("n", "gw", vim.lsp.buf.document_symbol, { desc = "Search document symbols [LSP]", buffer = bufnr })
-- 	vim.keymap.set("n", "gW", vim.lsp.buf.workspace_symbol, { desc = "Search workspace symbols [LSP]", buffer = bufnr })
-- 	vim.keymap.set("n", "gr", vim.lsp.buf.references, { desc = "Show references [LSP]", buffer = bufnr })
-- 	vim.keymap.set("n", "<c-k>", vim.lsp.buf.signature_help, { desc = "Show signature help [LSP]", buffer = bufnr })

-- 	-- LSP Saga keymaps
-- 	vim.keymap.set("n", "K", "<Cmd>Lspsaga hover_doc<CR>", { desc = "Hover documentation [LSP]", buffer = bufnr })
-- 	vim.keymap.set("n", "<leader>af", "<Cmd>Lspsaga code_action<CR>", { desc = "Code action [LSP]", buffer = bufnr })
-- 	vim.keymap.snn("n", "<leader>rn", "<Cmd>Lspsaga rename<CR>", { desc = "Rename [LSP]", buffer = bufnr })
-- 	vim.keymap.set(
-- 		"n",
-- 		"<leader>ls",
-- 		"<Cmd>Lspsaga show_line_diagnostics<CR>",
-- 		{ desc = "Show diagnostic at line [LSP]", buffer = bufnr }
-- 	)
-- 	vim.keymap.set(
-- 		"n",
-- 		"[e",
-- 		"<cmd>Lspsaga diagnostic_jump_prev<CR>",
-- 		{ desc = "Go to next diagnostic [LSP]", buffer = bufnr }
-- 	)
-- 	vim.keymap.set(
-- 		"n",
-- 		"]e",
-- 		"<cmd>Lspsaga diagnostic_jump_next<CR>",
-- 		{ desc = "Go to previous diagnostic [LSP]", buffer = bufnr }
-- 	)

-- 	if client.name == "tsserver" then
-- 		vim.keymap.set(
-- 			"n",
-- 			"<Leader>oi",
-- 			"<Cmd>OrganizeImports<CR>",
-- 			{ desc = "Organize imports [TS]", buffer = bufnr }
-- 		)
-- 	end
-- end

-- local capabilities = vim.lsp.protocol.make_client_capabilities()
-- capabilities.textDocument.completion.completionItem.snippetSupport = true
-- capabilities.textDocument.completion.completionItem.preselectSupport = true
-- capabilities.textDocument.completion.completionItem.insertReplaceSupport = true
-- capabilities.textDocument.completion.completionItem.resolveSupport = {
-- 	properties = {
-- 		"documentation",
-- 		"detail",
-- 		"additionalTextEdits",
-- 	},
-- }

-- local default_config = {
-- 	on_attach = on_attach,
-- 	capabilities = capabilities,
-- }

-- require("mason-tool-installer").setup({
-- 	ensure_installed = {
-- 		"eslint_d",
-- 		"prettier",
-- 		"stylua",
-- 	},
-- })
-- require("mason-lspconfig").setup({
-- 	ensure_installed = {
-- 		-- "bashls",
-- 		-- "cssls",
-- 		"diagnosticls",
-- 		-- "dockerls",
-- 		-- "gopls",
-- 		-- "html",
-- 		-- "jsonls",
-- 		-- "pylsp",
-- 		-- "sumneko_lua",
-- 		"rust_analyzer",
-- 		-- "tailwindcss",
-- 		"tsserver",
-- 		-- "yamlls",
-- 	},
-- 	automatic_installation = true,
-- })

-- -- Language Servers
-- -- lspconfig.pylsp.setup(default_config)
-- -- lspconfig.bashls.setup(default_config)
-- -- lspconfig.html.setup(default_config)
-- -- lspconfig.jsonls.setup(default_config)
-- -- lspconfig.yamlls.setup(default_config)
-- -- lspconfig.gopls.setup(default_config)
-- lspconfig.rust_analyzer.setup(default_config)

-- -- Tailwind CSS
-- local tw_highlight = require("tailwind-highlight")
-- lspconfig.tailwindcss.setup({
-- 	on_attach = function(client, bufnr)
-- 		tw_highlight.setup(client, bufnr, {
-- 			single_column = false,
-- 			mode = "background",
-- 			debounce = 200,
-- 		})

-- 		on_attach(client, bufnr)
-- 	end,
-- })

-- -- Typescript/JavaScript
-- local function organize_imports()
-- 	local params = {
-- 		command = "_typescript.organizeImports",
-- 		arguments = { vim.api.nvim_buf_get_name(0) },
-- 		title = "",
-- 	}
-- 	vim.lsp.buf.execute_command(params)
-- end

-- lspconfig.tsserver.setup({
-- 	on_attach = on_attach,
-- 	capabilities = capabilities,
-- 	commands = {
-- 		OrganizeImports = {
-- 			organize_imports,
-- 			description = "Organize Imports",
-- 		},
-- 	},
-- })

-- -- Lua
-- local lua_rtp = vim.split(package.path, ";")
-- table.insert(lua_rtp, "lua/?.lua")
-- table.insert(lua_rtp, "lua/?/init.lua")

-- -- lspconfig.sumneko_lua.setup(vim.tbl_extend("force", default_config, {
-- -- 	settings = {
-- -- 		Lua = {
-- -- 			runtime = {
-- -- 				version = "LuaJIT",
-- -- 				path = lua_rtp,
-- -- 			},
-- -- 			diagnostics = { globals = { "vim" } },
-- -- 			workspace = { library = vim.api.nvim_get_runtime_file("", true) },
-- -- 			telemetry = { enable = false },
-- -- 		},
-- -- 	},
-- -- }))

-- local diagnosticls_group = vim.api.nvim_create_augroup("DiagnosticLSGroup", {})
-- local diagnosticls = require("diagnosticls-configs")

-- diagnosticls.init({
-- 	on_attach = function(_, bufnr)
-- 		local format_opts = { name = "diagnosticls", bufnr = bufnr, async = false, timeout_ms = 2500 }

-- 		vim.keymap.set("n", "<leader>p", function()
-- 			vim.lsp.buf.format(format_opts)
-- 		end, { desc = "Format current buffer [LSP]", buffer = bufnr })

-- 		vim.api.nvim_clear_autocmds({ group = diagnosticls_group, buffer = bufnr })
-- 		vim.api.nvim_create_autocmd("BufWritePre", {
-- 			group = diagnosticls_group,
-- 			buffer = bufnr,
-- 			callback = function()
-- 				vim.lsp.buf.format(format_opts)
-- 			end,
-- 			desc = "Format on save [LSP]",
-- 		})
-- 	end,
-- })

-- local web_configs = {
-- 	linter = require("diagnosticls-configs.linters.eslint_d"),
-- 	formatter = require("diagnosticls-configs.formatters.prettier"),
-- }

-- diagnosticls.setup({
-- 	javascript = web_configs,
-- 	javascriptreact = web_configs,
-- 	typescript = web_configs,
-- 	typescriptreact = web_configs,
-- 	lua = {
-- 		formatter = require("diagnosticls-configs.formatters.stylua"),
-- 	},
-- })
