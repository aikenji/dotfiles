local keymap = vim.keymap

---------------------
-- General Keymaps
---------------------

-- built-in search and subsitution
keymap.set("n", "<ESC><ESC>", ":noh<CR><ESC>") -- clear search highlights
keymap.set("n", "gw", "*N", { desc = "search word under cursor" }) -- quick search and highlight same word

-- delete single char without copying into register
keymap.set("n", "x", '"_x')

-- Resize window using arrow keys
keymap.set("n", "<A-Up>", "<cmd>resize +2<cr>", { desc = "Increase window height" })
keymap.set("n", "<A-Down>", "<cmd>resize -2<cr>", { desc = "Decrease window height" })
keymap.set("n", "<A-Left>", "<cmd>vertical resize -1<cr>", { desc = "Decrease window width" })
keymap.set("n", "<A-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase window width" })

-- change number quickly
keymap.set("n", "<Up>", "<C-a>", { desc = "Increase number" })
keymap.set("n", "<Down>", "<C-x>", { desc = "Decrease number" })

----------------------
-- Plugin Keybinds
----------------------

-- markdown
keymap.set("n", "<leader>pd", "<cmd>MarkdownPreviewToggle<cr>", { desc = "Markdown Preview Toggle" })

-- comments
keymap.set("n", "<leader>/", function()
    require("Comment.api").toggle.linewise.current()
end, { desc = "Toggle comments" })
keymap.set(
    "v",
    "<leader>/",
    "<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>",
    { desc = "Toggle comments" }
)

-- todo comments
keymap.set("n", "]t", function()
    require("todo-comments").jump_next()
end, { desc = "Next todo comment" })

keymap.set("n", "[t", function()
    require("todo-comments").jump_prev()
end, { desc = "Previous todo comment" })

keymap.set("n", "<leader>tt", "<cmd>TodoLocList<cr>", { desc = "Todo Commnets LocList" })
keymap.set("n", "<leader>tf", "<cmd>TodoTelescope<cr>", { desc = "Todo Commnets Telescope" })
