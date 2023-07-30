local keymap = vim.keymap
local M = {}

function M.init()
    vim.opt.conceallevel = 2
    vim.g.vimtex_imaps_enabled = 0
    vim.g.vimtex_fold_enabled = 1
    vim.g.vimtex_view_method = "skim"
    vim.g.vimtex_indent_enabled = 0
    vim.g.tex_indent_items = 0

    vim.g.maplocalleader = " "
    keymap.set("n", "dsm", "<Plug>(vimtex-env-delete-math)") -- quick navi in normal mode
end

return M
