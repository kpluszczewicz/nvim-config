vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
  pattern = { "*.txt", "*.md" },
  callback = function()
    vim.cmd("nnoremap j gj")
    vim.cmd("nnoremap k gk")

    -- vim.opt.spelllang = "pl"
    -- vim.opt.spell = true
    vim.opt.linebreak = true
    vim.opt.wrap = true

    vim.api.nvim_create_user_command("UsunNiepotrzebneWielkieLitery", function()
      vim.cmd([[s/\%V\u/\l\0/gc]])
    end, {})
  end,
})

-- INFO deprecated. Now I use :LanguageCheatSheet
-- vim.api.nvim_create_autocmd({ "BufEnter" }, {
--   pattern = { "*.md" },
--   callback = function(env)
--     local mdguide_link = "https://www.markdownguide.org/cheat-sheet/"
--     local command = '! open ' .. mdguide_link
--     local message = "Type :Markdowncheatsheet to open page with nice help"
--     vim.notify(message, vim.log.levels.INFO, { title = "Hint" })
--     vim.api.nvim_buf_create_user_command(env.buf, "Markdowncheatsheet", command, {})
--   end
-- })

vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
  group = vim.api.nvim_create_augroup("PythonUtilities", { clear = true }),
  pattern = { "*.py" },
  callback = function()
    print("[filetype-features] Setting makeprg=python3 and set keymap <leader>m to :make")
    vim.cmd("set makeprg=python3\\ %")
    vim.keymap.set("n", "<leader>m", ":make!<CR>") -- '!' is to avoid error buffer problems
  end,
})

local bufnr = 5
local function table_empty(tbl)
  return #tbl == 1 and tbl[1] == ""
end
local function filter_empty(tbl)
  local result = {}
  for _, value in pairs(tbl) do
    if value ~= "" then
      table.insert(result, value)
    end
  end
  return result
end

vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = "pytest.py",
  group = vim.api.nvim_create_augroup("PythonTutorial", { clear = true }),
  callback = function()
    vim.fn.jobstart("python3 pytest.py < pyinput.txt", {
      stdout_buffered = true,
      on_stdout = function(_, data)
        if not table_empty(data) then
          local filtered_data = filter_empty(data)
          print("Data reveived by on_stdout: " .. vim.inspect(filtered_data))
          vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, filtered_data)
        end
      end,
      stderr_buffered = true,
      on_stderr = function(_, data)
        if not table_empty(data) then
          local filtered_data = filter_empty(data)
          print("Errors: " .. vim.inspect(filtered_data))
          vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, filtered_data)
        end
      end,
    })
  end,
})

-- local ruby_output_buf_nr = 7
-- vim.api.nvim_create_autocmd("BufWritePost", {
--   pattern = "simple_db.rb",
--   group = vim.api.nvim_create_augroup("RubyQuest", { clear = true }),
--   callback = function()
--     vim.fn.jobstart("ruby simple_db.rb < commands.txt ", {
--       stdout_buffered = true,
--       on_stdout = function(_, data)
--         if not table_empty(data) then
--           local filtered_data = filter_empty(data)
--           print("Data reveived by on_stdout: " .. vim.inspect(filtered_data))
--           vim.api.nvim_buf_set_lines(ruby_output_buf_nr, 0, -1, false, filtered_data)
--         end
--       end,
--       stderr_buffered = true,
--       on_stderr = function(_, data)
--         if not table_empty(data) then
--           local filtered_data = filter_empty(data)
--           print("Errors: " .. vim.inspect(filtered_data))
--           vim.api.nvim_buf_set_lines(ruby_output_buf_nr, 0, -1, false, filtered_data)
--         end
--       end,
--     })
--   end,
-- })
--
