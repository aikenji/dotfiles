local colors = require("utils.colors")

return {

  {
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
  },

  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    build = "cd app && yarn install",
    init = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end,
    ft = { "markdown" },
    keys = { { "<leader>pd", "<cmd>MarkdownPreviewToggle<cr>", desc = "Toggle MD preview" } },
  },

  {
    "obsidian-nvim/obsidian.nvim",
    version = "*", -- recommended, use latest release instead of latest commit
    lazy = true,
    ft = "markdown",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    config = function()
      require("obsidian").setup({
        workspaces = {
          {
            name = "second-brain",
            path = "~/Notes/second-brain/",
          },
        },
        disable_frontmatter = false,
        ui = {
          enable = false,
          checkboxes = {
            [" "] = { char = "󰄱", hl_group = "ObsidianTodo" },
            ["x"] = { char = "", hl_group = "ObsidianDone" },
          },
        },
        completion = {
          nvim_cmp = false,
          blink = true,
        },
        picker = {
          -- Set your preferred picker. Can be one of 'telescope.nvim', 'fzf-lua', 'mini.pick' or 'snacks.pick'.
          name = "snacks.pick",
          note_mappings = {
            -- Create a new note from your query.
            new = "<C-x>",
            -- Insert a link to the selected note.
            insert_link = "<C-l>",
          },
          tag_mappings = {
            -- Add tag(s) to current note.
            tag_note = "<C-x>",
            -- Insert a tag at the current location.
            insert_tag = "<C-l>",
          },
        },
        statusline = {
          enabled = true,
          format = "{{properties}} properties {{backlinks}} backlinks",
        },
      })
      vim.keymap.set("n", "<leader>ol", "<cmd>Obsidian<cr>", { desc = "Obsidian" })
      vim.keymap.set("n", "<leader>oo", "<cmd>ObsidianQuickSwitch<cr>", { desc = "Obsidian: Quick Switch" })
      vim.keymap.set("n", "<leader>oO", "<cmd>ObsidianOpen<cr>", { desc = "Obsidian: Open" })
      vim.keymap.set("n", "<leader>ot", "<cmd>ObsidianToday<cr>", { desc = "Obsidian: Today" })
      vim.keymap.set("n", "<leader>oT", "<cmd>ObsidianDailies<cr>", { desc = "Obsidian: Dailies" })
    end,
  },
}
