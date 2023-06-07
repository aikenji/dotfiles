local M = {}

function M.init()
    -- run nvim-tree safely
    local setup, neotree = pcall(require, "neo-tree")
    if not setup then
        return
    end

    -- configure nvim-tree
    neotree.setup({
        close_if_last_window = true,
        window = {
            mappings = {
                ["<tab>"] = { "toggle_preview", config = { use_float = true } },
                ["v"] = "open_vsplit",
                ["s"] = "open_split",
                ["S"] = "",
                ["P"] = "",
                ["<space>"] = "",
            },
        },
    })
end

return M
