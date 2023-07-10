local keymap = vim.keymap
local M = {}

function M.init()
    vim.opt.conceallevel = 2
    vim.g.vimtex_imaps_enabled = 0
    -- vim.g.vimtex_syntax_conceal = 1

    vim.g.vimtex_view_method = "skim"

    keymap.set("n", "dsm", "<Plug>(vimtex-env-delete-math)") -- quick navi in normal mode
end

return M
