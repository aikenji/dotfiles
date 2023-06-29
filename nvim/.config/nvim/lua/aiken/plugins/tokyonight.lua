local M = {}

function M.init()
    -- set colorscheme to nightfly with protected call
    -- in case it isn't installed
    local status, tn = pcall(require, "tokyonight")
    if not status then
        print("Colorscheme not found!") -- print error if colorscheme not installed
        return
    end

    tn.setup({
        style = "storm",
        transparent = false,
        dim_inactive = true, -- dims inactive windows
        lualine_bold = true, -- section headers in lualine theme will be bold
        styles = {
            comments = { italic = true },
            keywords = { bold = true, italic = false },
            functions = {},
            variables = {},
            -- background styles. Can be "dark", "transparent", "normal"
            sidebars = "dark",
            floats = "dark",
            hide_inactive_statusline = true,
        },
    })

    vim.cmd("colorscheme tokyonight-storm")
end

return M
