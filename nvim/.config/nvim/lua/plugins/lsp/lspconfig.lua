return {
  {
    -- Main LSP Configuration
    "neovim/nvim-lspconfig",
    dependencies = {
      {
        "williamboman/mason.nvim",
        opts = {
          ui = {
            border = "rounded",
            icons = {
              package_pending = " ",
              package_installed = "󰄳 ",
              package_uninstalled = "󰚌 ",
            },

            keymaps = {
              toggle_server_expand = "<CR>",
              install_server = "i",
              update_server = "u",
              check_server_version = "c",
              update_all_servers = "U",
              check_outdated_servers = "C",
              uninstall_server = "X",
              cancel_installation = "<C-c>",
            },
          },
        },
      },

      {
        "williamboman/mason-lspconfig.nvim",
        opts = {
          ensure_installed = {
            "lua_ls",
            "clangd",
            "basedpyright",
            "texlab",
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
      vim.lsp.enable("marksman")

      -- configure markdown server
      vim.lsp.enable("texlab")
    end,
  },
}
