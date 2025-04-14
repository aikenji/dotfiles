return {
  {
    -- navigate between tmux and vim
    "christoomey/vim-tmux-navigator",
    lazy = false,
    keys = {
      { "<C-h>", "<cmd> TmuxNavigateLeft<CR>", desc = "Go to left window" },
      { "<C-j>", "<cmd> TmuxNavigateDown<CR>", desc = "Go to lower window" },
      { "<C-k>", "<cmd> TmuxNavigateUp<CR>", desc = "Go to upper window" },
      { "<C-l>", "<cmd> TmuxNavigateRight<CR>", desc = "Go to right window" },
    },
  },
}
