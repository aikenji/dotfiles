return {
  cmd = { "basedpyright-langserver", "--stdio" },
  filetypes = { "python" },
  single_file_support = true,
  settings = {
    basedpyright = {
      analysis = {
        typeCheckingMode = "off",
        autoSearchPaths = true,
        diagnosticsMode = "workspace",
        useLibraryCodeForTypes = true,
        inlayHints = {
          variableTypes = true,
          functionReturnTypes = true,
          parameterNames = true,
          parameterTypes = true,
        },
      },
    },
  },
}
