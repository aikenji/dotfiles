local keymap = vim.keymap

---------------------
-- General Keymaps
---------------------

-- built-in search and subsitution
keymap.set("n", "<ESC><ESC>", ":noh<CR><ESC>") -- clear search highlights

-- delete single char without copying into register
keymap.set("n", "x", '"_x')

-- navigation in insert mode

keymap.set("i", "<C-l>", "<Right>", { desc = "move right in insert mode" })
keymap.set("i", "<C-h>", "<Left>", { desc = "move right in insert mode" })

-- Resize window using arrow keys
keymap.set("n", "<A-Up>", "<cmd>resize +2<cr>", { desc = "Increase window height" })
keymap.set("n", "<A-Down>", "<cmd>resize -2<cr>", { desc = "Decrease window height" })
keymap.set("n", "<A-Left>", "<cmd>vertical resize -1<cr>", { desc = "Decrease window width" })
keymap.set("n", "<A-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase window width" })

-- change number quickly
keymap.set("n", "<Up>", "<C-a>", { desc = "Increase number" })
keymap.set("n", "<Down>", "<C-x>", { desc = "Decrease number" })
