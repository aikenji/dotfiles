return {
  {
    "williamboman/mason.nvim",
    version = "*",
    opts = {
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
        keymaps = {
          apply_language_filter = "<C-f>",
          toggle_help = "?",
        },
      },
    },
  },
}
