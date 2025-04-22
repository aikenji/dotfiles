local colors = require("utils.colors")

return {
  "MeanderingProgrammer/render-markdown.nvim",
  enabled = true,
  init = function()
    -- Define color variables
    local color_bg1 = colors["linkarzu_color04"]
    local color_bg2 = colors["linkarzu_color02"]
    local color_bg3 = colors["linkarzu_color03"]
    local color_bg4 = colors["linkarzu_color01"]
    local color_bg5 = colors["linkarzu_color05"]
    local color_bg6 = colors["linkarzu_color08"]
    local color_fg1 = colors["linkarzu_color18"]
    local color_fg2 = colors["linkarzu_color19"]
    local color_fg3 = colors["linkarzu_color20"]
    local color_fg4 = colors["linkarzu_color21"]
    local color_fg5 = colors["linkarzu_color22"]
    local color_fg6 = colors["linkarzu_color23"]

    -- Heading colors (when not hovered over), extends through the entire line
    vim.cmd(string.format([[highlight Headline1Bg guibg=%s guifg=%s ]], color_bg1, color_fg1))
    vim.cmd(string.format([[highlight Headline2Bg guibg=%s guifg=%s ]], color_bg2, color_fg2))
    vim.cmd(string.format([[highlight Headline3Bg guibg=%s guifg=%s ]], color_bg3, color_fg3))
    vim.cmd(string.format([[highlight Headline4Bg guibg=%s guifg=%s ]], color_bg4, color_fg4))
    vim.cmd(string.format([[highlight Headline5Bg guibg=%s guifg=%s ]], color_bg5, color_fg5))
    vim.cmd(string.format([[highlight Headline6Bg guibg=%s guifg=%s ]], color_bg6, color_fg6))
  end,
  opts = {
    bullet = {
      -- Turn on / off list bullet rendering
      enabled = true,
    },
    checkbox = {
      -- Turn on / off checkbox state rendering
      enabled = true,
      -- Determines how icons fill the available space:
      --  inline:  underlying text is concealed resulting in a left aligned icon
      --  overlay: result is left padded with spaces to hide any additional text
      position = "inline",
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
