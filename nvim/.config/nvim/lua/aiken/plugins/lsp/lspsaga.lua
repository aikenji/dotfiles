local M = {}

function M.init()
    require("lspsaga").setup({
        symbol_in_winbar = {
            enable = false,
        },
    })
end

return M
