local colors = require("utils.colors")

return {
  -- copilot.lua
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    opts = {
      suggestion = { enabled = false },
      panel = { enabled = false },
      filetypes = {
        markdown = false,
        tex = false,
        help = true,
      },
    },
  },

  -- blink.cmp
  {
    "saghen/blink.cmp",
    -- optional: provides snippets for the snippet source
    dependencies = {
      { "L3MON4D3/LuaSnip", version = "v2.*", dependencies = "rafamadriz/friendly-snippets" },
      "fang2hou/blink-copilot",
    },
    version = "1.*",
    init = function()
      require("blink-copilot").setup({
        kind_icon = "",
      })

      require("luasnip").setup({
        -- Enable autotriggered snippets
        enable_autosnippets = true,
        -- Use Tab (or some other key if you prefer) to trigger visual selection
        store_selection_keys = "<Tab>",
        history = true,
        update_events = { "TextChanged", "TextChangedI" },
      })

      require("luasnip.loaders.from_vscode").lazy_load()
      -- load snippets form ~/.config/nvim/snippets/
      require("luasnip.loaders.from_lua").lazy_load({ paths = "~/.config/nvim/snippets/" })
      -- load vs-code like snippets from plugins (e.g. friendly-snippets)

      vim.api.nvim_set_hl(0, "SnippetTabstop", { fg = colors.color06, bg = colors.color13 })
    end,

    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
      -- See :h blink-cmp-config-keymap for defining your own keymap
      keymap = {
        preset = "none",
        ["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
        -- ["<C-e>"] = { "hide", "fallback" },
        ["<CR>"] = { "accept", "fallback" },

        ["<Tab>"] = { "snippet_forward", "fallback" },
        ["<S-Tab>"] = { "snippet_backward", "fallback" },

        ["<C-j>"] = { "select_next", "fallback_to_mappings" },
        ["<C-k>"] = { "select_prev", "fallback_to_mappings" },

        ["<C-u>"] = { "scroll_documentation_up", "fallback" },
        ["<C-d>"] = { "scroll_documentation_down", "fallback" },
      },

      appearance = {
        -- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
        -- Adjusts spacing to ensure icons are aligned
        nerd_font_variant = "mono",
      },

      -- (Default) Only show the documentation popup when manually triggered
      completion = {
        documentation = {
          auto_show = true,
          window = { border = "rounded" },
        },
        list = { selection = { preselect = true, auto_insert = false } },
        menu = {
          -- border = "rounded",
          draw = {
            columns = { { "kind_icon" }, { "label" }, { "source_name" } },
          },
        },
      },

      snippets = { preset = "luasnip" },
      sources = {
        default = { "lsp", "path", "snippets", "buffer", "copilot" },
        per_filetype = {
          markdown = { "path", "snippets", "buffer" },
        },
        providers = {
          snippets = {
            score_offset = 10,
          },
          copilot = {
            name = "copilot",
            module = "blink-copilot",
            score_offset = 100,
            async = true,
          },
        },
      },

      -- See the fuzzy documentation for more information
      fuzzy = { implementation = "prefer_rust_with_warning" },
    },
  },
}
