local M = {}

function M.init()
    -- import which-key plugin safely
    local setup, whichkey = pcall(require, "which-key")
    if not setup then
        return
    end

    vim.o.timeout = true
    vim.o.timeoutlen = 300
    whichkey.setup()
    whichkey.register({
        mode = { "n", "v" },
        ["<leader>f"] = { name = "+file/find" },
        ["<leader>p"] = { name = "+preview" },
    })
end

return M
