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
            replace = "sc", -- Replace surrounding
            suffix_last = "p", -- Suffix to search with "prev" method
        },
    })
end

return M
