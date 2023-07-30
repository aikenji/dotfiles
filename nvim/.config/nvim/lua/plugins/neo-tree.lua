local M = {}

function M.init()
    -- run nvim-tree safely
    local setup, neotree = pcall(require, "neo-tree")
    if not setup then
        return
    end

    -- configure nvim-tree
    neotree.setup({
        -- configuration for nerdfont
        default_component_configs = {
            icon = {
                folder_empty = "󰜌",
                folder_empty_open = "󰜌",
            },
            git_status = {
                symbols = {
                    renamed = "󰁕",
                    unstaged = "󰄱",
                },
            },
        },
        document_symbols = {
            kinds = {
                File = { icon = "󰈙", hl = "Tag" },
                Namespace = { icon = "󰌗", hl = "Include" },
                Package = { icon = "󰏖", hl = "Label" },
                Class = { icon = "󰌗", hl = "Include" },
                Property = { icon = "󰆧", hl = "@property" },
                Enum = { icon = "󰒻", hl = "@number" },
                Function = { icon = "󰊕", hl = "Function" },
                String = { icon = "󰀬", hl = "String" },
                Number = { icon = "󰎠", hl = "Number" },
                Array = { icon = "󰅪", hl = "Type" },
                Object = { icon = "󰅩", hl = "Type" },
                Key = { icon = "󰌋", hl = "" },
                Struct = { icon = "󰌗", hl = "Type" },
                Operator = { icon = "󰆕", hl = "Operator" },
                TypeParameter = { icon = "󰊄", hl = "Type" },
                StaticMethod = { icon = "󰠄 ", hl = "Function" },
            },
        },
        source_selector = {
            sources = {
                { source = "filesystem", display_name = " 󰉓 Files " },
                { source = "git_status", display_name = " 󰊢 Git " },
            },
        },
        -- custom configuration
        close_if_last_window = true,
        window = {
            width = 30,
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
