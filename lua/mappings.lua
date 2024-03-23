-- Add <count>j|k motion to jumplist
-- TODO: to nie jest doskonałe rozwiązanie,
vim.cmd([[nnoremap <expr> k (v:count > 1 ? "m'" . v:count : '') . 'k']])
vim.cmd([[nnoremap <expr> j (v:count > 1 ? "m'" . v:count : '') . 'j']])

-- [[ Miscelanous ]]

-- Adding empty lines above and below cursor in normal mode
vim.keymap.set("n", "<C-M-j>", ':call append(line("."), "")<CR>', { desc = "Add empty line below" })
vim.keymap.set("n", "<C-M-k>", ':call append(line(".")-1, "")<CR>', { desc = "Add empty line above" })

-- Jump over one character in insert mode, ie to skip automatically added parenthesis
vim.keymap.set("i", "<C-Bslash>", "<Right>", { desc = "Jump one character right in insert mode" })

-- <S-Enter> opens new line wherever cursor is and jumps there
vim.keymap.set("i", "<S-Enter>", "<C-O>o")

-- Go to end of the line in insert mode
vim.keymap.set("i", "<C-;>", "<C-o>$")

-- [[ Terminal mode ]]

-- NOTE This won't work in all terminal emulators/tmux/etc. Try your own mapping
--  or just use <C-\><C-n> to exit terminal mode
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- [[ Keybindings to make split navigation easier ]]
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd for a list of all window commands`
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- [[ Diagnostics ]]
--
-- Navigate diagnostic messages
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous [D]iagnostic message" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next [D]iagnostic message" })

-- Show diagnostics
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show diagnostic [E]rror messages" })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })
