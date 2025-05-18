return {
  {
    -- navigate code easily
    "folke/flash.nvim",
    event = "VeryLazy",
    config = function()
      require("flash").setup({
        prompt = {
          prefix = { { " JUMP", "FlashPromptIcon" } },
        },
      })

      vim.api.nvim_set_hl(0, "FlashLabel", { fg = "white", bg = "#ff3030" })
      vim.keymap.set({ "n", "x", "o" }, "s", function()
        require("flash").jump()
      end, { desc = "Flash" })
      vim.keymap.set({ "n", "x", "o" }, "S", function()
        require("flash").treesitter()
      end, { desc = "Flash Treesitter" })
    end,
  },
}
