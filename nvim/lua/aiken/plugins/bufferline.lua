local M = {}

function M.init()
    local status_ok, bufferline = pcall(require, "bufferline")
    if not status_ok then
        return
    end

    bufferline.setup({
        options = {
            mode = "buffers",
            separator_style = "thin",
            max_name_length = 30,
            max_prefix_length = 30,
            tab_size = 21,
            offsets = { { filetype = "neo-tree", text = "", padding = 1 } },
            show_buffer_close_icons = true,
            enforce_regular_tabs = true,
            hover = {
                enabled = true,
                delay = 200,
                reveal = { "close" },
            },
        },
    })
end

return M
