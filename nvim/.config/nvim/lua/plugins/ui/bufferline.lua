return {
    {
        "akinsho/bufferline.nvim",
        version = "*",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        opts = {
            highlights = require("catppuccin.groups.integrations.bufferline").get(),
            options = {
                mode = "buffers",
                separator_style = "thin",
                max_name_length = 30,
                max_prefix_length = 30,
                tab_size = 21,
                offsets = { { filetype = "explorer", text = "", padding = 1 } },
                show_buffer_close_icons = true,
                enforce_regular_tabs = true,
                hover = {
                    enabled = true,
                    delay = 200,
                    reveal = { "close" },
                },
            },
        },
    },
}
