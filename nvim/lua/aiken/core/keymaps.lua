vim.g.mapleader = " " -- set leader key to space

local keymap = vim.keymap

---------------------
-- General Keymaps
---------------------

-- clear search highlights
keymap.set("n", "<ESC><ESC>", ":noh<CR><ESC>")

-- deltet single char without copying into register
keymap.set("n", "x", '"_x')

----------------------
-- Plugin Keybinds
----------------------

-- nvim-tree
keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>") -- toggle file explorer
