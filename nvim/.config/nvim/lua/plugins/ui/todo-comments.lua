return {
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    lazy = false,
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
      {
        "<leader>xt",
        "<cmd>Trouble todo<cr>",
        desc = "Trouble of Todo comments",
      },
      {
        "<leader>st",
        "<cmd>lua Snacks.picker.todo_comments()<cr>",
        desc = "todo-comments",
      },
    },
  },
}
