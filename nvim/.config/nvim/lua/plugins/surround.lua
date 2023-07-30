local M = {}

function M.init()
    -- run nvim-tree safely
    local status, surround = pcall(require, "mini.surround")
    if not status then
        return
    end

    surround.setup({
        -- Duration (in ms) of highlight when calling `MiniSurround.highlight()`
        highlight_duration = 1500,

        -- Module mappings. Use `''` (empty string) to disable one.
        mappings = {
            add = "gza", -- Add surrounding in Normal and Visual modes
            delete = "gzd", -- Delete surrounding
            find = "gzf", -- Find surrounding (to the right)
            find_left = "gzF", -- Find surrounding (to the left)
            highlight = "gzh", -- Highlight surrounding
            replace = "gzc", -- Replace surrounding
            update_n_lines = "gzn", -- Update `n_lines`

            suffix_last = "p", -- Suffix to search with "prev" method
            suffix_next = "n", -- Suffix to search with "next" method
        },
    })
end

return M
