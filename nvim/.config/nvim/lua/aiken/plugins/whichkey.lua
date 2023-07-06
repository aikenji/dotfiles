local M = {}

function M.init()
    -- import which-key plugin safely
    local setup, whichkey = pcall(require, "which-key")
    if not setup then
        return
    end

    vim.o.timeout = true
    vim.o.timeoutlen = 300
    whichkey.setup({
        plugins = {
            presets = {
                operators = false,
            },
        },
        icons = {
            breadcrumb = ">>", -- symbol used in the command line area that shows your active key combo
            separator = " ", -- symbol used between a key and it's label
            group = " ", -- symbol prepended to a group
        },
        window = {
            border = "single", -- none, single, double, shadow
            position = "bottom", -- bottom, top
            margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left].
            padding = { 1, 2, 1, 2 }, -- extra window padding [top, right, bottom, left]
            winblend = 0, -- value between 0-100 0 for fully opaque and 100 for fully transparent
            zindex = 1000, -- positive value to position WhichKey above other floating windows.
        },
        layout = {
            height = { min = 4, max = 25 }, -- min and max height of the columns
            width = { min = 20, max = 50 }, -- min and max width of the columns
            spacing = 3, -- spacing between columns
            align = "center", -- align columns left, center or right
        },
    })
    whichkey.register({
        mode = { "n", "v" },
        ["<leader>f"] = { name = "+file/find" },
        ["<leader>p"] = { name = "+preview" },
    })
end

return M
