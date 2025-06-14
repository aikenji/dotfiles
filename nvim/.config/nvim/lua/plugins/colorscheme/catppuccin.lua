return {
  {
    -- colorscheme catppuccin
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      -- set colorscheme with protected call
      -- in case it isn't installed
      local status, catp = pcall(require, "catppuccin")
      if not status then
        print("Colorscheme not found!") -- print error if colorscheme not installed
        return
      end

      catp.setup({
        flavour = "macchiato", -- latte, frappe, macchiato, mocha
        transparent_background = false,
        dim_inactive = {
          enabled = false, -- dims the background color of inactive window
          shade = "dark",
          percentage = 0.15, -- percentage of the shade to apply to the inactive window
        },
        styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
          comments = { "italic" }, -- Change the style of comments
          conditionals = { "italic" },
          loops = { "italic" },
          functions = { "bold", "italic" },
          keywords = { "bold", "italic" },
        },
        integrations = {
          cmp = true,
          gitsigns = true,
          treesitter = true,
          treesitter_context = true,
          notify = true,
          noice = true,
          mason = true,
          which_key = true,
        },
      })
    end,
  },
}
