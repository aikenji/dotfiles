local imselect = require("utils.imselect")

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
