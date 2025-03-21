local M = {}

function M.init()
    -- import comment plugin safely
    local setup, comment = pcall(require, "Comment")
    if not setup then
        return
    end

    -- enable comment
    comment.setup({
        mappings = {
            basic = false,
            extra = false,
        },
    })
end

return M
