-- :LanguageCheatSheet       opens https://learnxinyminutes.com/docs/{filetype}
-- TODO: Need to tweak this
vim.api.nvim_create_user_command(
  "LanguageCheatSheet",
  function()
    -- check if file is on the disk, if not, download it
    local cheatpath = vim.fn.stdpath("config") .. "/cheatsheets/"
    local mappings = {
      lua = "learnlua.lua",
      ruby = "learnruby.rb",
      markdown = "markdown.md"
    }
    vim.api.nvim_cmd(vim.api.nvim_parse_cmd('sp ' .. cheatpath .. mappings[vim.bo.filetype], {}), {})
  end,
  {}
)
