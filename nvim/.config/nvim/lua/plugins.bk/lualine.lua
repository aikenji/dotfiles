local M = {}

function M.init()
    -- Bubbles config for lualine
    -- Author: lokesh-krishna
    -- MIT license, see LICENSE for more details.


    require("lualine").setup({
        options = {
            theme = "catppuccin",
            disabled_filetypes = {
                statusline = { "neo-tree", "alpha", "dashboard", "lspsagaoutline" },
            },
            component_separators = "",
            section_separators = { left = "", right = "" },
        },
        sections = {
            lualine_a = { { "mode", separator = { left = "" }, right_padding = 2 } },
            lualine_b = {
                -- "filename",
                "diagnostics",
                { "branch", icon = { "", color = { fg = tn_color.yellow } } },
                "diff",
            },
            lualine_c = {
                "%=", --[[ add your center compoentnts here in place of this comment ]]
            },
            lualine_x = {},
            lualine_y = { "filetype", "progress" },
            lualine_z = {
                { "location", separator = { right = "" }, left_padding = 2 },
            },
        },
        inactive_sections = {
            lualine_a = { "filename" },
            lualine_b = {},
            lualine_c = {},
            lualine_x = {},
            lualine_y = {},
            lualine_z = { "location" },
        },
        tabline = {},
        extensions = {},
    })
end

return M
