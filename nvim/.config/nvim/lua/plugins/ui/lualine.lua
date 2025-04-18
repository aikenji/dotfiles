return {
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      -- new colors for theme
      local tn_color = {
        none = "NONE",
        bg_dark = "#1f2335",
        bg = "#24283b",
        bg_highlight = "#292e42",
        terminal_black = "#414868",
        fg = "#c0caf5",
        fg_dark = "#a9b1d6",
        fg_gutter = "#3b4261",
        dark3 = "#545c7e",
        comment = "#565f89",
        dark5 = "#737aa2",
        blue0 = "#3d59a1",
        blue = "#7aa2f7",
        cyan = "#7dcfff",
        blue1 = "#2ac3de",
        blue2 = "#0db9d7",
        blue5 = "#89ddff",
        blue6 = "#b4f9f8",
        blue7 = "#394b70",
        magenta = "#bb9af7",
        magenta2 = "#ff007c",
        purple = "#9d7cd8",
        orange = "#ff9e64",
        yellow = "#e0af68",
        green = "#9ece6a",
        green1 = "#73daca",
        green2 = "#41a6b5",
        teal = "#1abc9c",
        red = "#f7768e",
        red1 = "#db4b4b",
      }

      require("lualine").setup({
        options = {
          theme = "catppuccin",
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
              "diagnostics",

              symbols = { error = " ", warn = " ", info = " ", hint = "󰠠 " },
              diagnostics_color = {
                error = { fg = tn_color.red },
                warn = { fg = tn_color.yellow },
                info = { fg = tn_color.cyan },
              },
            },
            {
              "branch",
              icon = " ",
              color = { fg = tn_color.purple, gui = "bold" },
            },
            {
              "diff",
              -- Is it me or the symbol for modified us really weird
              symbols = { added = " ", modified = "󰇊 ", removed = " " },
              diff_color = {
                added = { fg = tn_color.green },
                modified = { fg = tn_color.orange },
                removed = { fg = tn_color.red },
              },
            },
          },
          lualine_c = {
            "filename",
          },
          lualine_x = {},
          lualine_y = { "filetype", "progress" },
          lualine_z = {
            { "location", separator = { right = "" }, left_padding = 2 },
          },
        },
        inactive_sections = {
          lualine_a = { "filename" },
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
