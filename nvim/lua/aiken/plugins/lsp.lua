return {

  {
    -- managing & installing lsp servers, linters & formatters
    "williamboman/mason.nvim", -- in charge of managing lsp servers, linters & formatters
    config = function()
      -- import mason plugin safely
      local mason_status, mason = pcall(require, "mason")
      if not mason_status then
        return
      end

      mason.setup()
    end
    

  },

  {
    "williamboman/mason-lspconfig.nvim", -- bridges gap b/w mason & lspconfig
    config = function()
      -- import mason-lspconfig plugin safely
      local mason_lspconfig_status, mason_lspconfig = pcall(require, "mason-lspconfig")
      if not mason_lspconfig_status then
        return
      end

      mason_lspconfig.setup({
        -- list of servers for mason to install
        ensure_installed = {
          "clangd"
        },
        -- auto-install configured servers (with lspconfig)
        automatic_installation = true, -- not the same as ensure_installed
      })
    end
    

  },

  -- configuring lsp servers
  "neovim/nvim-lspconfig", -- easily configure language servers
}
