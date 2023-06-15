local keymap = vim.keymap

---------------------
-- General Keymaps
---------------------

vim.g.mapleader = " " -- set leader key to space

-- auto source lua config file after saving
keymap.set("n", "<leader>s", "<cmd> luafile ~/.config/nvim/init.lua<CR>", { desc = "Source lua config file" })
-- built-in search and subsitution
keymap.set("n", "<ESC><ESC>", ":noh<CR><ESC>") -- clear search highlights
keymap.set("n", "D", "*N") -- quick search and highlight same word

-- delete single char without copying into register
keymap.set("n", "x", '"_x')

-- cursor movement
keymap.set("n", "L", "5l", { desc = "move left *5" }) -- navi in insert mode
keymap.set("n", "H", "5h", { desc = "move right *5" })
keymap.set("n", "J", "5j", { desc = "move down *5" })
keymap.set("n", "K", "5k", { desc = "move up *5" })
keymap.set({ "n", "v" }, "<C-b>", "^", { desc = "beginning of line" })
keymap.set({ "n", "v" }, "<C-e>", "$", { desc = "end of line" })
keymap.set("i", "<C-b>", "<ESC>^i", { desc = "beginning of line" })
keymap.set("i", "<C-e>", "<End>", { desc = "end of line" })
keymap.set("i", "<C-h>", "<Left>", { desc = "move left" }) -- navi in insert mode
keymap.set("i", "<C-l>", "<Right>", { desc = "move right" })
keymap.set("i", "<C-j>", "<Down>", { desc = "move down" })
keymap.set("i", "<C-k>", "<Up>", { desc = "move up" })

-- buffers movement
keymap.set("n", "[b", "<cmd>BufferLineCyclePrev<cr>", { desc = "Prev buffer" })
keymap.set("n", "]b", "<cmd>BufferLineCycleNext<cr>", { desc = "Next buffer" })

-- Move the window using the <ctrl> hjkl
keymap.set("n", "<C-h>", "<cmd> TmuxNavigateLeft<CR>", { desc = "Go to left window" })
keymap.set("n", "<C-j>", "<cmd> TmuxNavigateDown<CR>", { desc = "Go to lower window" })
keymap.set("n", "<C-k>", "<cmd> TmuxNavigateUp<CR>", { desc = "Go to upper window" })
keymap.set("n", "<C-l>", "<cmd> TmuxNavigateRight<CR>", { desc = "Go to right window" })

-- Resize window using arrow keys
keymap.set("n", "<A-Up>", "<cmd>resize +2<cr>", { desc = "Increase window height" })
keymap.set("n", "<A-Down>", "<cmd>resize -2<cr>", { desc = "Decrease window height" })
keymap.set("n", "<A-Left>", "<cmd>vertical resize -1<cr>", { desc = "Decrease window width" })
keymap.set("n", "<A-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase window width" })

-- change number quickly
keymap.set("n", "<Up>", "<C-a>", { desc = "Increase number" })
keymap.set("n", "<Down>", "<C-x>", { desc = "Decrease number" })

-- save and quit
-- keymap.set("n", "<C-w>", "<cmd>w<cr>", { desc = "Save" })
keymap.set("n", "<C-q>", "<cmd>q<cr>", { desc = "Quit" })

----------------------
-- Plugin Keybinds
----------------------

-- neo-tree
keymap.set("n", "<leader>E", "<cmd>Neotree toggle %:p:h reveal_force_cwd<cr>", { desc = "Explorer NeoTree (cwd)" })
keymap.set("n", "<leader>e", "<cmd>Neotree toggle <cr>", { desc = "Explorer NeoTree" })

-- telescope
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>") -- find files within current working directory, respects .gitignore
keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>") -- find string in current working directory as you type
keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>") -- find string under cursor in current working directory
keymap.set("n", "<leader>fg", "<cmd>Telescope current_buffer_fuzzy_find<cr>", { desc = "Fuzzy Find" }) -- list open buffers in current neovim instance
keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>") -- list available help tags
keymap.set("n", "<leader>ft", "<cmd>Telescope lsp_document_symbols<cr>") -- list all functions/structs/classes/modules in the current buffer

-- telescope git commands
-- keymap.set("n", "<leader>gc", "<cmd>Telescope git_commits<cr>") -- list all git commits (use <cr> to checkout) ["gc" for git commits]
-- keymap.set("n", "<leader>gfc", "<cmd>Telescope git_bcommits<cr>") -- list git commits for current file/buffer (use <cr> to checkout) ["gfc" for git file commits]
-- keymap.set("n", "<leader>gb", "<cmd>Telescope git_branches<cr>") -- list git branches (use <cr> to checkout) ["gb" for git branch]
-- keymap.set("n", "<leader>gs", "<cmd>Telescope git_status<cr>") -- list current changes per file with diff preview ["gs" for git status]

-- toggleterm
keymap.set("n", "<leader>t", "<cmd>ToggleTerm<cr>", { desc = "Launch Terminal" })

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
