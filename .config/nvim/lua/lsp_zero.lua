---
-- LSP setup
---
local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
	local opts = { buffer = bufnr, remap = false }

	vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
	vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
	vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
	vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
	vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
	vim.keymap.set('n', 'gy', vim.lsp.buf.type_definition, opts)
	vim.keymap.set("n", "<leader>la", vim.lsp.buf.code_action, opts)
	vim.keymap.set("n", "<leader>lf", vim.diagnostic.open_float, opts)
	vim.keymap.set("n", "<leader>lr", vim.lsp.buf.rename, opts)
	vim.keymap.set("n", "<leader>ls", vim.lsp.buf.workspace_symbol, opts)
	vim.keymap.set("n", "[d", vim.diagnostic.goto_next, opts)
	vim.keymap.set("n", "]d", vim.diagnostic.goto_prev, opts)
	vim.keymap.set('n', '<leader>lf', vim.diagnostic.open_float, opts)
	vim.keymap.set('n', '<leader>ll', vim.diagnostic.setloclist, opts)
	vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
	vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
	vim.keymap.set('n', '<space>wl', function()
		print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
	end, opts)
end)

---
--- Mason setup
--
require('mason').setup({})
require('mason-lspconfig').setup({
	ensure_installed = { 'clangd', 'lua_ls', 'gopls', 'tsserver' },
	handlers = {
		lsp_zero.default_setup,
		lua_ls = function()
			local lua_opts = lsp_zero.nvim_lua_ls()
			require('lspconfig').lua_ls.setup(lua_opts)
		end,
		pylsp = function()
			require 'lspconfig'.pylsp.setup {
				settings = {
					pylsp = {
						plugins = {
							pycodestyle = {
								enabled = true,
								ignore = { 'W391' },
								maxLineLength = 200
							}
						}
					}
				}
			}
		end
	}
})

---
-- Autocompletion config
---
local cmp = require('cmp')
local cmp_action = lsp_zero.cmp_action()

cmp.setup({
	mapping = cmp.mapping.preset.insert({
		["<C-p>"] = cmp.mapping.select_prev_item(),
		["<C-n>"] = cmp.mapping.select_next_item(),
		['<C-b>'] = cmp.mapping.scroll_docs(-4),
		['<C-f>'] = cmp.mapping.scroll_docs(4),
		['<C-Space>'] = cmp.mapping.complete(),
		['<C-e>'] = cmp.mapping.abort(),
		['<C-y>'] = cmp.mapping.confirm({ select = true }),
		['<C-j>'] = cmp_action.luasnip_jump_forward(),
		['<C-k>'] = cmp_action.luasnip_jump_backward(),
	}),
	sources = cmp.config.sources({
		{ name = 'nvim_lsp' },
		{ name = 'buffer' },
		{ name = 'path' },
	})
})

-- local cfg = {}
-- require "lsp_signature".setup(cfg)

---
--- Formatter
---

local conform = require("conform")

-- Conform will run multiple formatters sequentially
-- Use a sub-list to run only the first available formatter
conform.setup({
	formatters_by_ft = {
		cpp = { "clang-format" },
		css = { "prettier" },
		graphql = { "prettier" },
		html = { "prettier" },
		javascript = { "prettier" },
		javascriptreact = { "prettier" },
		json = { "prettier" },
		lua = { "stylua" },
		markdown = { "prettier" },
		python = { "autopep8 --max-line-length=200" },
		svelte = { "prettier" },
		typescript = { "prettier" },
		typescriptreact = { "prettier" },
		yaml = { "prettier" },
		asm = { "asmfmt" },
	},
	-- format_on_save = {
	-- 	lsp_fallback = true,
	-- 	async = false,
	-- 	timeout_ms = 500,
	-- }
})

vim.keymap.set({ "n", "v" }, "<leader>F", function()
	conform.format({
		lsp_fallback = true,
		async = false,
		timeout_ms = 500,
	})
end)

---
--- Linter
---
-- local lint = require('lint')

-- lint.linters_by_ft = {
-- 	javascript = { "eslint_d" },
-- 	typescript = { "eslint_d" },
-- 	javascriptreact = { "eslint_d" },
-- 	typescriptreact = { "eslint_d" },
-- 	svelte = { "eslint_d" },
-- 	cpp = { 'clangtidy', },
-- 	c = { 'clangtidy', },
-- 	python = { 'pylint' },
-- }

-- vim.keymap.set("n", "<leader>le", function()
-- 	lint.try_lint()
-- end)

-- vim.api.nvim_create_autocmd({ "BufWritePost" }, {
-- 	callback = function()
-- 		-- try_lint without arguments runs the linters defined in `linters_by_ft`
-- 		-- for the current filetype
-- 		require("lint").try_lint()

-- 		-- You can call `try_lint` with a linter name or a list of names to always
-- 		-- run specific linters, independent of the `linters_by_ft` configuration
-- 		-- require("lint").try_lint("cspell")
-- 	end,
-- })
