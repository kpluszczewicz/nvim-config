-- A blazing fast and easy to configure Neovim statusline written in Lua.
return {
  "nvim-lualine/lualine.nvim",
  opts = { theme = 'dracula' }
  -- when opts is set – it will automatically call
  -- require("lualine").setuop(opts)
}
