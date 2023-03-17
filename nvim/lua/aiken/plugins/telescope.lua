local M = {}

function M.init()
    -- import telescope plugin safely
    local telescope_setup, telescope = pcall(require, "telescope")
    if not telescope_setup then
        return
    end

    -- import telescope actions safely
    local actions_setup, actions = pcall(require, "telescope.actions")
    if not actions_setup then
        return
    end

    -- configure telescope
    telescope.setup({
        defaults = {
            mappings = {
                i = {
                    ["<C-q>"] = "close",
                    ["<tab>"] = "move_selection_previous",
                    ["<S-tab>"] = "move_selection_next",
                },
                n = {
                    ["q"] = "close",
                    ["v"] = "select_vertical",
                },
            },
        },
    })

    telescope.load_extension("fzf")
end

return M
