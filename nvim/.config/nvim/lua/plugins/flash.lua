return {
    {
        -- navigate code easily
        "folke/flash.nvim",
        event = "VeryLazy",
        opts = {
            prompt = {
                prefix = { { " JUMP", "FlashPromptIcon" } },
            }, -- use default configs
        },
        keys = {
            {
                "s",
                mode = { "n", "x", "o" },
                function()
                    require("flash").jump()
                end,
                desc = "Flash",
            },
            {
                "S",
                mode = { "n", "o", "x" },
                function()
                    require("flash").treesitter()
                end,
                desc = "Flash Treesitter",
            },
        },
    },


}
