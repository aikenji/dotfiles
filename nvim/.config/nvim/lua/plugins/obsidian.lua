return {
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
