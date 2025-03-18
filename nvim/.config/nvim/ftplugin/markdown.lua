local M = {}

local imselect = require("utils.imselect")

-- Global variable to store the enabled/disabled state of the input_cn
M.enabled = false

-- Core functionality of the input_cn
function M.input_cn()
    if M.enabled then
        print("input-cn is enabled")
        vim.api.nvim_create_augroup("imselect", { clear = true })

        vim.api.nvim_create_autocmd("InsertLeave", {
            group = "imselect",
            callback = imselect.macInsertLeave,
        })

        vim.api.nvim_create_autocmd("InsertEnter", {
            group = "imselect",
            callback = imselect.macInsertEnter,
        })

        vim.api.nvim_create_autocmd("FocusGained", {
            group = "imselect",
            callback = imselect.macFocusGained,
        })

        vim.api.nvim_create_autocmd("FocusLost", {
            group = "imselect",
            callback = imselect.macFocusLost,
        })
    else
        print("input-cn is disabled")
        vim.api.nvim_del_augroup_by_name("imselect")
    end
end

-- Toggle the input_cn on/off
function M.toggle_input_cn()
    M.enabled = not M.enabled -- Flip the state
    print("input-cn state: " .. (M.enabled and "Enabled" or "Disabled"))
    M.input_cn() -- Execute the feature logic after toggling
end

-- Create a command to toggle the input_cn
vim.api.nvim_create_user_command("ToggleInputCN", function()
    M.toggle_input_cn()
end, {})

-- Bind a keymap to toggle the input_cn (optional)
vim.keymap.set("n", "<leader>ti", M.toggle_input_cn, { noremap = true, silent = true, desc = "Toggle input-cn" })

return M
