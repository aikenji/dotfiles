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
        style = "night",
        transparent = true,
        dim_inactive = true, -- dims inactive windows
        lualine_bold = true, -- section headers in lualine theme will be bold
        styles = {
            comments = { italic = true },
            keywords = { italic = true },
            functions = {},
            variables = {},
            -- background styles. Can be "dark", "transparent", "normal"
            sidebars = "transparent",
            floats = "transparent",
        },
    })

    vim.cmd("colorscheme tokyonight-night")
end

return M
