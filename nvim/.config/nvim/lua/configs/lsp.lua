vim.lsp.enable({
  "lua_ls",
  "clangd",
  "basedpyright",
  "bashls",
  "marksman",
  "texlab",
})

-- diagnostic settings
vim.diagnostic.config({
  virtual_lines = { current_line = true },
  -- virtual_text = { current_line = true },
  underline = true,
  update_in_insert = false,
  severity_sort = true,
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = " ",
      [vim.diagnostic.severity.WARN] = " ",
      [vim.diagnostic.severity.INFO] = " ",
      [vim.diagnostic.severity.HINT] = "󰠠 ",
    },
    linehl = {
      [vim.diagnostic.severity.ERROR] = "ErrorMsg",
    },
  },
})
