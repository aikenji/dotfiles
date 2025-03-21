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
            sorting_strategy = "ascending",
            layout_config = {
                prompt_position = "top",
                width = { padding = 0.05 },
                height = { padding = 0.05 },
                preview_width = 0.5,
            },
            mappings = {
                i = {
                    ["<C-c>"] = "close",
                    ["<C-h>"] = "which_key",
                    ["<C-k>"] = "move_selection_previous",
                    ["<C-j>"] = "move_selection_next",
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
