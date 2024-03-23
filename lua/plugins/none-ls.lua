return {
	"nvimtools/none-ls.nvim",
	config = function()
		local null_ls = require("null-ls")

		null_ls.setup({
			sources = {
				null_ls.builtins.formatting.stylua,
				null_ls.builtins.formatting.prettier, -- js
				null_ls.builtins.formatting.black, -- python
				null_ls.builtins.formatting.isort, -- python
				null_ls.builtins.formatting.rubocop,
				null_ls.builtins.diagnostics.rubocop.with({
					extra_args = {
						"--display-cop-names",
					},
				}),
				null_ls.builtins.diagnostics.erb_lint,
			},
		})
		-- TODO: Maybe should remove this below
		--
		-- local wk = require("which-key")
		--
		-- wk.register({
		-- 	c = {
		-- 		name = "code",
		-- 		f = {
		-- 			function()
		-- 				vim.lsp.buf.format()
		-- 			end,
		-- 			"format code using default formatter",
		-- 		},
		-- 	},
		-- }, { prefix = "<leader>" })
	end,
}
