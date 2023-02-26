return {

  -- preferred colorscheme
  'folke/tokyonight.nvim', 

  config = function()
    -- set colorscheme to nightfly with protected call
    -- in case it isn't installed
    local status, tn = pcall(require, "tokyonight")
    if not status then
      print("Colorscheme not found!") -- print error if colorscheme not installed
      return
    end

    tn.setup({
      style = "storm",
      transparent = false, 
      dim_inactive = true, -- dims inactive windows
      lualine_bold = true, -- section headers in lualine theme will be bold
      styles = {
        comments = { italic = true },
        keywords = { italic = true },
      },
    })
    vim.cmd("colorscheme tokyonight-storm")
  end

}

