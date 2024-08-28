local M = {}

function M.init()
    vim.opt.conceallevel = 2
    vim.g.vimtex_complete_enabled = 0
    vim.g.vimtex_imaps_enabled = 0
    vim.g.vimtex_indent_enabled = 0
    vim.g.tex_indent_items = 0
    vim.g.vimtex_fold_enabled = 1
    vim.g.vimtex_format_enabled = 1
    vim.g.vimtex_view_method = "skim"
    vim.g.maplocalleader = " "

    -- Don't open QuickFix for warning messages if no errors are present
    vim.g.vimtex_quickfix_open_on_warning = 0
end

return M
