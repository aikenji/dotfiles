local M = {}

function M.init()
    -- set colorscheme with protected call
    -- in case it isn't installed
    local status, catp = pcall(require, "catppuccin")
    if not status then
        print("Colorscheme not found!") -- print error if colorscheme not installed
        return
    end

    catp.setup({
        flavour = "mocha", -- latte, frappe, macchiato, mocha
        transparent_background = true,
        dim_inactive = {
            -- FIX:some display bug of noice in transparent mode when dim is enabled
            enabled = false, -- dims the background color of inactive window
            shade = "dark",
            percentage = 0.15, -- percentage of the shade to apply to the inactive window
        },
        styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
            comments = { "italic" }, -- Change the style of comments
            conditionals = { "italic" },
            loops = { "italic" },
            functions = { "italic" },
            keywords = { "bold", "italic" },
        },
        integrations = {
            cmp = true,
            gitsigns = true,
            treesitter = true,
            treesitter_context = true,
            notify = true,
            noice = true,
            mini = true,
            alpha = true,
            neotree = true,
            mason = true,
            lsp_saga = true,
            which_key = true,
        },
    })

    vim.cmd("colorscheme catppuccin")

    -- setup the color of falsh plugins
    vim.api.nvim_set_hl(0, "FlashLabel", { fg = "white", bg = "#ff3030" })

    -- setup the color of cursorline
    -- vim.api.nvim_set_hl(0, "CursorLine", { bg = "#162011" })
end

return M
