local M = {}

function M.init()
  -- import nvim-treesitter plugin safely
  local status, treesitter = pcall(require, "nvim-treesitter.configs")
  if not status then
    return
  end

  -- configure treesitter
  treesitter.setup({
    -- enable syntax highlighting
    highlight = {
      enable = true,
    },
    -- enable indentation
    indent = { enable = true, disable = { "python" } },
    -- enable autotagging (w/ nvim-ts-autotag plugin)
    autotag = { enable = true },
    -- ensure these language parsers are installed
    ensure_installed = {
      "c",
      "cpp",
      "markdown",
      "bash",
      "lua",
      "vim",
      "gitignore",
    },
    -- auto install above language parsers
    auto_install = true,
  })
end

return M
