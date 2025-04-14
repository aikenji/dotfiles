return {
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
      highlight = {
        comments_only = false,
      },
    },
    keys = {
      {
        "]t",
        function()
          require("todo-comments").jump_next()
        end,
        desc = "Next todo comments",
      },
      {
        "[t",
        function()
          require("todo-comments").jump_prev()
        end,
        desc = "Previous todo comments",
      },
      -- {
      --     "<leader>tt",
      --     "<cmd>TodoLocList<cr>",
      --     desc = "LocList of Todo comments",
      -- },
    },
  },
}
