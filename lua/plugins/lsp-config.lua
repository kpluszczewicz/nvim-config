return {
	{
		-- Neovim setup for init.lua and plugin development with full signature help,
		--  docs and completion for the nvim lua API.
		"folke/neodev.nvim",
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			require("neodev").setup({})

			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			local lspconfig = require("lspconfig")
			lspconfig.lua_ls.setup({
				capabilities = capabilities,
			})
			lspconfig.tsserver.setup({})
			lspconfig.pyright.setup({
				capabilities = capabilities,
			})
			lspconfig.jsonls.setup({
				capabilities = capabilities,
			})

			-- lspconfig.solargraph.setup({
			--   capabilities = capabilities,
			--   -- PLUGIN / neovim native lsp / ruby / solargraph
			--   -- cmd = { os.getenv( "HOME" ) .. "/.rvm/shims/solargraph", 'stdio' },
			--   cmd = { "solargraph", "stdio" },
			--   root_dir = lspconfig.util.root_pattern("Gemfile", ".git", "."),
			--   settings = {
			--     solargraph = {
			--       autoformat = false,
			--       formatting = false,
			--       completion = true,
			--       diagnostic = true,
			--       folding = true,
			--       references = true,
			--       rename = true,
			--       symbols = true,
			--     },
			--   },
			-- })
			-- lspconfig.ruby_ls.setup({
			--   capabilities = capabilities,
			--   on_attach = function(client, buffer)
			--     setup_diagnostics(client, buffer)
			--   end,
			-- })

			lspconfig.cssls.setup({
				capabilities = capabilities,
			})
			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})

			local wk = require("which-key")

			wk.register({
				e = {
					function()
						vim.diagnostic.open_float()
					end,
					"Show diagnostics in float window",
				},
			}, { prefix = "<leader>" })
		end,
	},
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"lua_ls",
					"tsserver",
					"pyright",
					-- rubocop: Don't install rubocop here for the sake of rails extension,
					-- that can't be easily installed via Mason. I installed them
					-- via project Gemfile
					-- "ruby_ls",
					"cssls",
				},
			})
		end,
	},
	{
		"smjonas/inc-rename.nvim",
		config = function()
			require("inc_rename").setup()
		end,
	},
}
