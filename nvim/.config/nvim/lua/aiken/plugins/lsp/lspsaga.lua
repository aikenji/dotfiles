local M = {}

function M.init()
    require("lspsaga").setup({
        symbol_in_winbar = {
            enable = false,
        },
        ui = {
            kind = require("catppuccin.groups.integrations.lsp_saga").custom_kind(),
        },
    })
end

return M
