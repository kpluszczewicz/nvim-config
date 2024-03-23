-- Lua
return {
	"abecodes/tabout.nvim",
	enabled = false, -- for now this plugin clashes with luaSnip tab, maybe will look at this later
	-- there are some hints in docs how to do it
	config = function()
		require("tabout").setup({
			tabkey = "<Tab>", -- key to trigger tabout, set to an empty string to disable
			backwards_tabkey = "<S-Tab>", -- key to trigger backwards tabout, set to an empty string to disable
			act_as_tab = true, -- shift content if tab out is not possible
			act_as_shift_tab = false, -- reverse shift content if tab out is not possible (if your keyboard/terminal supports <S-Tab>)
			default_tab = "<C-t>", -- shift default action (only at the beginning of a line, otherwise <TAB> is used)
			default_shift_tab = "<C-d>", -- reverse shift default action,
			enable_backwards = true, -- well ...
			completion = true, -- if the tabkey is used in a completion pum
			tabouts = {
				{ open = "'", close = "'" },
				{ open = '"', close = '"' },
				{ open = "`", close = "`" },
				{ open = "(", close = ")" },
				{ open = "[", close = "]" },
				{ open = "{", close = "}" },
			},
			ignore_beginning = true, --[[ if the cursor is at the beginning of a filled element it will rather tab out than shift the content ]]
			exclude = {}, -- tabout will ignore these filetypes
		})
	end,
	-- after = {'nvim-cmp'} -- if a completion plugin is using tabs load it before
	-- Kamil: I set priority to lower value (default is 50)
	--        That makes tabout to load after nvim-cmp I think
	priority = 40,
	-- wants = {'nvim-treesitter'}, -- or require if not used so far
}
