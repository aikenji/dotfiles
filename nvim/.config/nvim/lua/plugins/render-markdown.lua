local colors = require("utils.colors")

return {
  "MeanderingProgrammer/render-markdown.nvim",
  enabled = true,
  init = function()
    -- Define color variables

    -- Heading colors (when not hovered over), extends through the entire line
    vim.api.nvim_set_hl(0, "Headline1Bg", { fg = colors.color08, bg = colors.color01 })
    vim.api.nvim_set_hl(0, "Headline2Bg", { fg = colors.color09, bg = colors.color02 })
    vim.api.nvim_set_hl(0, "Headline3Bg", { fg = colors.color10, bg = colors.color03 })
    vim.api.nvim_set_hl(0, "Headline4Bg", { fg = colors.color11, bg = colors.color04 })
    vim.api.nvim_set_hl(0, "Headline5Bg", { fg = colors.color12, bg = colors.color05 })
    vim.api.nvim_set_hl(0, "Headline6Bg", { fg = colors.color13, bg = colors.color06 })
  end,
  opts = {
    bullet = {
      -- Turn on / off list bullet rendering
      enabled = true,
    },
    checkbox = {
      -- Turn on / off checkbox state rendering
      enabled = true,
      unchecked = {
        -- Replaces '[ ]' of 'task_list_marker_unchecked'
        icon = "   󰄱 ",
        -- Highlight for the unchecked icon
        highlight = "RenderMarkdownUnchecked",
        -- Highlight for item associated with unchecked checkbox
        scope_highlight = nil,
      },
      checked = {
        -- Replaces '[x]' of 'task_list_marker_checked'
        icon = "   󰱒 ",
        -- Highlight for the checked icon
        highlight = "RenderMarkdownChecked",
        -- Highlight for item associated with checked checkbox
        scope_highlight = nil,
      },
    },
    html = {
      -- Turn on / off all HTML rendering
      enabled = false,
      comment = {
        -- Turn on / off HTML comment concealing
        conceal = true,
      },
    },
    heading = {
      sign = false,
      icons = { "󰎤 ", "󰎧 ", "󰎪 ", "󰎭 ", "󰎱 ", "󰎳 " },
      backgrounds = {
        "Headline1Bg",
        "Headline2Bg",
        "Headline3Bg",
        "Headline4Bg",
        "Headline5Bg",
        "Headline6Bg",
      },
    },
  },
}
