local colors = require("catppuccin.palettes").get_palette("macchiato")

return {
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("lualine").setup({
        options = {
          -- theme = "catppuccin",
          globalstatus = true,
          disabled_filetypes = {
            statusline = { "snacks_dashboard", "snacks_layout_box" },
          },
          component_separators = "",
          section_separators = { left = "", right = "" },
        },
        sections = {
          lualine_a = { { "mode", separator = { left = "" }, right_padding = 2 } },
          lualine_b = {
            {
              "branch",
              icon = " ",
              color = { fg = colors.overlay2, gui = "bold" },
            },
            {
              "diff",
              symbols = { added = " ", modified = "󰇊 ", removed = " " },
              diff_color = {
                added = { fg = colors.green },
                modified = { fg = colors.peach },
                removed = { fg = colors.red },
              },
            },
          },
          lualine_c = { "g:obsidian" },
          lualine_x = {
            {
              "diagnostics",
              symbols = { error = " ", warn = " ", info = " ", hint = "󰠠 " },
              diagnostics_color = {
                error = { fg = colors.red },
                warn = { fg = colors.yellow },
                info = { fg = colors.sky },
              },
            },
            {
              "lsp_status",
              icon = { " ", color = { fg = colors.text } },
              symbols = {
                spinner = { "⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏" },
                done = "",
                separator = " ",
              },
              color = { fg = colors.overlay2, gui = "bold" },
            },
          },
          lualine_y = {
            {
              "filetype",
              color = { fg = colors.overlay2 },
            },
            {
              "progress",
              color = { fg = colors.overlay2, gui = "bold" },
            },
          },
          lualine_z = {
            { "location", color = { gui = "bold" }, separator = { right = "" }, left_padding = 2 },
          },
        },
        inactive_sections = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = {},
          lualine_x = {},
          lualine_y = {},
          lualine_z = { "location" },
        },
        tabline = {},
        extensions = {},
      })
    end,
  },
}
