# My nvim config

# Thanks
- @typecraft - for his great video-tutorial about creating modularized nvim config,
- @Tj DeVries - for great nvim-kickstart project from I've learnt many useful things, and copied some ideas.

## My own mappings to speed up workflow a bit:

```lua
-- Adding empty lines above and below cursor in normal mode
--  You may need to set your terminal properly to handle Option key.
--  In my case, I had to add those lines to alacritty.toml configuration file:
--  [window]
--  option_as_alt = "Both"

vim.keymap.set("n", "<C-M-j>", ':call append(line("."), "")<CR>', { desc = "Add empty line below" })
vim.keymap.set("n", "<C-M-k>", ':call append(line(".")-1, "")<CR>', { desc = "Add empty line above" })

-- Go to end of the line in insert mode
vim.keymap.set("i", "<C-;>", "<C-o>$")

-- Jump over one character in insert mode, ie to skip automatically added parenthesis or quotes
--  Work only with proper settings in terminal
--  For example, in Alacritty you should add those lines to your alacritty.toml:
--  [[keyboard]]
--  bindings = [
--      { key = "Space", mods = "Shift", chars = "\u001C" },
--      { key = "Return", mods = "Shift", chars = "\u001B[13;2u"}
--  ]

vim.keymap.set("i", "<C-Bslash>", "<Right>", { desc = "Jump one character right in insert mode" })
-- <S-Enter> opens new line wherever cursor is and jumps there
vim.keymap.set("i", "<S-Enter>", "<C-O>o")

```
