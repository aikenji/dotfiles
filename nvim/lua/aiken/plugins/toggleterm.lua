M = {}

local Terminal = require("toggleterm.terminal").Terminal
local lazygit = Terminal:new({ cmd = "lazygit", direction = "float", hidden = true })

function _lazygit_toggle()
    lazygit:toggle()
end

function M.init()
    require("toggleterm").setup({
        direction = "float",
        float_opts = {
            border = "curved",
        },
    })
    vim.api.nvim_set_keymap(
        "n",
        "<leader>g",
        "<cmd>lua _lazygit_toggle()<CR>",
        { noremap = true, silent = true, desc = "Lazygit" }
    )
end

return M
