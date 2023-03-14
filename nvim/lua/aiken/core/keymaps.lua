local keymap = vim.keymap

---------------------
-- General Keymaps
---------------------

vim.g.mapleader = " " -- set leader key to space

-- clear search highlights
keymap.set("n", "<ESC><ESC>", ":noh<CR><ESC>")

-- deltet single char without copying into register
keymap.set("n", "x", '"_x')

-- line movement
keymap.set({ "n", "v", "o" }, "H", "^", { desc = "Use 'H' as '^'" }) -- replace ^ by H to move line head
keymap.set({ "n", "v", "o" }, "L", "$", { desc = "Use 'L' as '$'" }) -- replace $ by L to move line end

-- buffers movement
keymap.set("n", "<A-h>", "<cmd>BufferLineCyclePrev<cr>", { desc = "Prev buffer" })
keymap.set("n", "<A-l>", "<cmd>BufferLineCycleNext<cr>", { desc = "Next buffer" })

-- Move the window using the <ctrl> hjkl
keymap.set("n", "<C-h>", "<C-w>h", { desc = "Go to left window" })
keymap.set("n", "<C-j>", "<C-w>j", { desc = "Go to lower window" })
keymap.set("n", "<C-k>", "<C-w>k", { desc = "Go to upper window" })
keymap.set("n", "<C-l>", "<C-w>l", { desc = "Go to right window" })

-- Resize window using arrow keys
keymap.set("n", "<leader><Up>", "<cmd>resize +2<cr>", { desc = "Increase window height" })
keymap.set("n", "<leader><Down>", "<cmd>resize -2<cr>", { desc = "Decrease window height" })
keymap.set("n", "<leader><Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease window width" })
keymap.set("n", "<leader><Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase window width" })

-- change number quickly
keymap.set("n", "<Up>", "<C-a>", { desc = "Increase number" })
keymap.set("n", "<Down>", "<C-x>", { desc = "Decrease number" })

-- save and quit
keymap.set("n", "<leader>w", "<cmd>w<cr>", { desc = "Save" })
keymap.set("n", "<leader>q", "<cmd>q<cr>", { desc = "Quit" })

----------------------
-- Plugin Keybinds
----------------------

-- neo-tree
keymap.set("n", "<leader>e", function()
    require("neo-tree.command").execute({ toggle = true, dir = vim.loop.cwd() })
end, { desc = "Explorer NeoTree (cwd)" })

-- telescope
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>") -- find files within current working directory, respects .gitignore
keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>") -- find string in current working directory as you type
keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>") -- find string under cursor in current working directory
keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>") -- list open buffers in current neovim instance
keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>") -- list available help tags
keymap.set("n", "<leader>ft", "<cmd>Telescope lsp_document_symbols<cr>") -- list all functions/structs/classes/modules in the current buffer

-- telescope git commands
-- keymap.set("n", "<leader>gc", "<cmd>Telescope git_commits<cr>") -- list all git commits (use <cr> to checkout) ["gc" for git commits]
-- keymap.set("n", "<leader>gfc", "<cmd>Telescope git_bcommits<cr>") -- list git commits for current file/buffer (use <cr> to checkout) ["gfc" for git file commits]
-- keymap.set("n", "<leader>gb", "<cmd>Telescope git_branches<cr>") -- list git branches (use <cr> to checkout) ["gb" for git branch]
-- keymap.set("n", "<leader>gs", "<cmd>Telescope git_status<cr>") -- list current changes per file with diff preview ["gs" for git status]

-- lazygit
keymap.set("n", "<leader>lg", "<cmd>term lazygit<cr>", { desc = "lauch lazygit" })

-- markdown
keymap.set("n", "<leader>md", "<cmd>MarkdownPreviewToggle<cr>", { desc = "Markdown preview toggle" })
