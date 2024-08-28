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

    function _G.set_terminal_keymaps()
        local opts = { buffer = 0 }
        vim.keymap.set("t", "<C-q>", [[<C-\><C-n><cmd>q<cr>]], opts)
    end

    -- if you only want these mappings for toggle term use term://*toggleterm#* instead
    vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")
end

return M
