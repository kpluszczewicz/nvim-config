return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	config = function()
		vim.keymap.set("n", "<C-n>", ":Neotree toggle<CR>")
		-- NOTE: Below is to disable highlight for untracked RoR project
		-- require("neo-tree").setup({
		-- 	enable_git_status = false,
		-- })
	end,
}
