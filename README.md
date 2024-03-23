# My nvim config

Thanks to @typecraft I've created modularized nvim config.
Added many interesting plugins.

## My own mappings to speed up workflow a bit:

```lua
-- Adding empty lines above and below cursor in normal mode
vim.keymap.set("n", "<C-M-j>", ':call append(line("."), "")<CR>', { desc = "Add empty line below" })
vim.keymap.set("n", "<C-M-k>", ':call append(line(".")-1, "")<CR>', { desc = "Add empty line above" })

-- Jump over one character in insert mode, ie to skip automatically added parenthesis
vim.keymap.set("i", "<C-Bslash>", "<Right>", { desc = "Jump one character right in insert mode" })

-- <S-Enter> opens new line wherever cursor is and jumps there
vim.keymap.set("i", "<S-Enter>", "<C-O>o")

-- Go to end of the line in insert mode
vim.keymap.set("i", "<C-;>", "<C-o>$")

```
