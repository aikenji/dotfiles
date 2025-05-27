return {
  {
    "stevearc/oil.nvim",
    ---@module 'oil'
    ---@type oil.SetupOpts
    -- Optional dependencies
    dependencies = { { "echasnovski/mini.icons", opts = {} } },
    -- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if you prefer nvim-web-devicons
    -- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
    lazy = false,
    keys = { vim.keymap.set("n", "-", "<CMD>Oil --preview<CR>", { desc = "Open parent directory" }) },
    config = function()
      -- define the oil winbar
      function _G.get_oil_winbar()
        local dir = require("oil").get_current_dir()
        if dir then
          return vim.fn.fnamemodify(dir, ":~")
        else
          return vim.api.nvim_buf_get_name(0)
        end
      end
      local detail = false

      -- setup oil
      require("oil").setup({
        default_file_explorer = true,
        keymaps = {
          ["<C-h>"] = false,
          ["<C-l>"] = false,
          ["<C-k>"] = false,
          ["<C-j>"] = false,
          ["<C-r>"] = "actions.refresh",
          ["<leader>y"] = "actions.yank_entry",
          ["-"] = "actions.close",
          ["<BS>"] = "actions.parent",
          ["gd"] = {
            desc = "Toggle file detail view",
            callback = function()
              detail = not detail
              if detail then
                require("oil").set_columns({ "icon", "permissions", "size", "mtime" })
              else
                require("oil").set_columns({ "icon" })
              end
            end,
          },
        },
        win_options = {
          winbar = "%!v:lua.get_oil_winbar()",
        },
      })
    end,
  },
}
