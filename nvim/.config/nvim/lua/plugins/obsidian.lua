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

        -- notes_subdir = "notes",
        new_notes_location = "notes_subdir",

        disable_frontmatter = false,
        note_id_func = function(title)
          return title
        end,
        note_frontmatter_func = function(note)
          local out = { id = note.id, alias = note.alias, date = os.date("%Y-%m-%d"), tags = note.tags }
          return out
        end,

        daily_notes = {
          folder = "dailies",
          date_format = "%Y-%m-%d",
          alias_format = "%B %-d, %Y",
          default_tags = { "daily-notes" },
          template = nil,
          workdays_only = true,
        },
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
        attachments = {
          img_folder = "assets", -- This is the default

          -- A function that determines default name or prefix when pasting images via `:Obsidian paste_img`.
          ---@return string
          img_name_func = function()
            -- Prefix image names with timestamp.
            return string.format("")
          end,

          -- A function that determines the text to insert in the note when pasting an image.
          -- It takes two arguments, the `obsidian.Client` and an `obsidian.Path` to the image file.
          -- This is the default implementation.
          ---@param client obsidian.Client
          ---@param path obsidian.Path the absolute path to the image file
          ---@return string
          img_text_func = function(client, path)
            path = client:vault_relative_path(path) or path
            return string.format("![%s](%s)", path.name, path)
          end,
        },

        statusline = {
          enabled = true,
          format = "{{properties}} properties {{backlinks}} backlinks",
        },
      })
      vim.keymap.set("n", "<leader>ot", "<cmd>ObsidianTemplate<CR>", { desc = "Insert Obsidian Template" })
      vim.keymap.set("n", "<leader>op", "<cmd>ObsidianPasteImg<CR>", { desc = "Obsidian Paste Img" })
      vim.keymap.set("n", "<leader>oO", "<cmd>ObsidianOpen<CR>", { desc = "Open in Obsidian App" })
      vim.keymap.set("n", "<leader>ob", "<cmd>ObsidianBacklinks<CR>", { desc = "Show ObsidianBacklinks" })
      vim.keymap.set("n", "<leader>ol", "<cmd>ObsidianLinks<CR>", { desc = "Show ObsidianLinks" })
      vim.keymap.set("n", "<leader>on", "<cmd>ObsidianNew<CR>", { desc = "Create New Note" })
      vim.keymap.set("n", "<leader>os", "<cmd>ObsidianSearch<CR>", { desc = "Search Obsidian" })
      vim.keymap.set("n", "<leader>oo", "<cmd>ObsidianQuickSwitch<CR>", { desc = "Quick Switch" })
    end,
  },
}
