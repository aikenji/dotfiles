local M = {}

function M.init()
    -- import lualine plugin safely
    local status, lualine = pcall(require, "lualine")
    if not status then
        return
    end

    -- get lualine nightfly theme
    local lualine_nightfly = require("lualine.themes.nightfly")

    -- new colors for theme
    local new_colors = {
        blue = "#65D1FF",
        green = "#3EFFDC",
        violet = "#FF61EF",
        yellow = "#FFDA7B",
        black = "#000000",
        uiuc_blue = "#13294B",
        uiuc_orange = "#E84A27",
    }

    -- change nightlfy theme colors
    lualine_nightfly.normal.a.bg = new_colors.blue
    lualine_nightfly.insert.a.bg = new_colors.uiuc_orange
    lualine_nightfly.visual.a.bg = new_colors.violet
    lualine_nightfly.command = {
        a = {
            gui = "bold",
            bg = new_colors.yellow,
            fg = new_colors.black, -- black
        },
    }

    -- configure lualine with modified theme
    lualine.setup({
        options = {
            theme = lualine_nightfly,
            disabled_filetypes = {
                statusline = { "neo-tree", "alpha", "dashboard", "lspsagaoutline" },
            },
        },
        sections = {
            lualine_c = {
                {
                    "filename",
                    path = 1, -- show relative path
                    color = { fg = new_colors.blue },
                    -- show lspsaga symbolwinbar
                    -- function()
                    --     return require("lspsaga.symbolwinbar"):get_winbar()
                    -- end,
                },
            },
        },
    })
end

return M
