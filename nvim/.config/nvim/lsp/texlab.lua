return {
  cmd = { "texlab" },
  filetypes = { "tex", "plaintex", "bib" },
  root_markers = { ".git", ".latexmkrc", "latexmkrc", ".texlabroot", "texlabroot", "Tectonic.toml" },
  settings = {
    texlab = {
      rootDirectory = nil,
      -- chktex = {
      --   onOpenAndSave = false,
      --   onEdit = false,
      -- },
      -- diagnosticsDelay = 300,
      -- bibtexFormatter = "texlab",
      -- formatterLineLength = 80,
    },
  },
}
