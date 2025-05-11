return {
  {
    "norcalli/nvim-colorizer.lua",
    opts = {},
    init = function()
      vim.keymap.set("n", "<leader>uz", ":ColorizerToggle<cr>", { desc = "Enable Colorizer" })
    end,
  },
}
