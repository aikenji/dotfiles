return {
  {
    -- Main LSP Configuration
    "neovim/nvim-lspconfig",
    version = "1.*",
    dependencies = {
      {
        "williamboman/mason.nvim",
        version = "1.*",
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

      {
        "williamboman/mason-lspconfig.nvim",
        version = "1.*",
        opts = {
          ensure_installed = {
            -- lua
            "lua_ls",
            -- shell
            "bashls",
            -- C
            "clangd",
            -- python
            "basedpyright",
            -- tex
            "texlab",
            -- markdown
            "marksman",
          },
        },
      },
    },

    config = function()
      -- import lspconfig plugin safely
      local lspconfig_status, lspconfig = pcall(require, "lspconfig")
      if not lspconfig_status then
        return
      end

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
          -- linehl = {
          --     [vim.diagnostic.severity.ERROR] = "ErrorMsg",
          -- },
        },
      })

      -- configure cpp clangd
      lspconfig["clangd"].setup({
        cmd = { "clangd" },
        filetype = { "c", "cpp", "objc", "objcpp", "cuda", "proto" },
        single_file_support = true,
      })

      lspconfig["basedpyright"].setup({
        cmd = { "basedpyright-langserver", "--stdio" },
        filetype = { "python" },
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
      })

      -- configure lua server (with special settings)
      lspconfig["lua_ls"].setup({
        settings = {
          Lua = {
            hint = { enable = true },
            diagnostics = {
              globals = { "vim", "Snacks" },
            },
            workspace = {
              -- make language server aware of runtime files
              library = {
                [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                [vim.fn.stdpath("config") .. "/lua"] = true,
              },
            },
          },
        },
      })

      -- configure markdown server
      lspconfig["marksman"].setup({})
      vim.lsp.enable("marksman")

      -- configure tex server
      -- vim.lsp.enable("texlab")

      -- configure shell server
      lspconfig["bashls"].setup({
        filetypes = { "bash", "sh", "zsh" },
      })
    end,
  },
}
