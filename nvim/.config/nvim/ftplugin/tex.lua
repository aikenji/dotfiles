local opt = vim.opt
local keymap = vim.keymap
-- shell check

opt.spelllang = "en_us"
opt.spell = true

-- keybinding for vimtex
keymap.set("n", "dsm", "<Plug>(vimtex-env-delete-math)")
keymap.set({ "x", "o" }, "ai", "<Plug>(vimtex-am)")
keymap.set({ "x", "o" }, "ii", "<Plug>(vimtex-im)")
keymap.set({ "x", "o" }, "am", "<Plug>(vimtex-a$)")
keymap.set({ "x", "o" }, "im", "<Plug>(vimtex-i$)")
