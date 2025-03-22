return {
    {
        "folke/todo-comments.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        opts = {},
        keys = {
            {
                "]t",
                function()
                    require("todo-comments").jump_next()
                end,
                desc = "Next todo comments",
            },
            {
                "[t",
                function()
                    require("todo-comments").jump_prev()
                end,
                desc = "Previous todo comments",
            },
            {
                "<leader>tt",
                "<cmd>TodoLocList<cr>",
                desc = "LocList of Todo comments",
            },
        },
    },

    {
        "numToStr/Comment.nvim",
        opts = {},
        keys = {
            {
                "<leader>/",
                function()
                    require("Comment.api").toggle.linewise.current()
                end,
                desc = "Toggle comments",
            },

            {
                "<leader>/",
                mode = "v",
                "<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>",
                desc = "Toggle comments",
            },
        },
    },
}
