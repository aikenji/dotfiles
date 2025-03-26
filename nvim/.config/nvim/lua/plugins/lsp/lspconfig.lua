return {
    {
        -- Main LSP Configuration
        "neovim/nvim-lspconfig",
        dependencies = {
            { "williamboman/mason.nvim", opts = {} },
            "williamboman/mason-lspconfig.nvim",
            "hrsh7th/cmp-nvim-lsp",
        },
        config = function()
            -- import mason plugin safely
            local mason_status, mason = pcall(require, "mason")
            if not mason_status then
                return
            end

            -- import mason-lspconfig plugin safely
            local mason_lspconfig_status, mason_lspconfig = pcall(require, "mason-lspconfig")
            if not mason_lspconfig_status then
                return
            end

            -- import lspconfig plugin safely
            local lspconfig_status, lspconfig = pcall(require, "lspconfig")
            if not lspconfig_status then
                return
            end

            local lsputil_status, util = pcall(require, "lspconfig/util")
            if not lsputil_status then
                return
            end

            -- import cmp-nvim-lsp plugin safely
            local cmp_nvim_lsp_status, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
            if not cmp_nvim_lsp_status then
                return
            end

            -- setup mason
            mason.setup({
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
            })

            -- setup mason_lspconfig
            mason_lspconfig.setup({
                -- list of servers for mason to install
                ensure_installed = {
                    "lua_ls",
                    "clangd",
                    "pyright",
                },
            })

            -- used to enable autocompletion (assign to every lsp server config)
            local capabilities = cmp_nvim_lsp.default_capabilities()
            capabilities.offsetEncoding = "utf-16"

            -- enable keybinds only for when lsp server available
            local on_attach = function(client, bufnr) end

            -- diagnostic virtual texts
            vim.diagnostic.config({
                virtual_text = true,
                underline = true,
                update_in_insert = false,
                severity_sort = true,
                signs = {
                    text = {
                        [vim.diagnostic.severity.ERROR] = " ",
                        [vim.diagnostic.severity.WARN] = " ",
                        [vim.diagnostic.severity.INFO] = " ",
                        [vim.diagnostic.severity.HINT] = " ",
                    },
                    linehl = {
                        [vim.diagnostic.severity.ERROR] = "ErrorMsg",
                    },
                },
            })

            -- configure cpp clangd
            lspconfig["clangd"].setup({
                capabilities = capabilities,
                on_attach = on_attach,
                cmd = { "clangd" },
                filetype = { "c", "cpp", "objc", "objcpp", "cuda", "proto" },
                root_dir = util.root_pattern(
                    ".clangd",
                    ".clang-tidy",
                    ".clang-format",
                    "compile_commands.json",
                    "compile_flags.txt",
                    "configure.ac",
                    ".git"
                ),
                single_file_support = true,
            })

            -- configure pyright server
            lspconfig["pyright"].setup({
                capabilities = capabilities,
                on_attach = on_attach,
                cmd = { "pyright-langserver", "--stdio" },
                filetype = { "python" },
                single_file_support = true,
                settings = {
                    python = {
                        analysis = {
                            autoSearchPaths = true,
                            diagnosticsMode = "workspace",
                            useLibraryCodeForTypes = true,
                        },
                    },
                },
            })

            -- lspconfig["basedpyright"].setup({
            --     capabilities = capabilities,
            --     on_attach = on_attach,
            --     cmd = { "basedpyright-langserver", "--stdio" },
            --     filetype = { "python" },
            --     single_file_support = true,
            --     settings = {
            --         basedpyright = {
            --             analysis = {
            --                 autoSearchPaths = true,
            --                 diagnosticsMode = "workspace",
            --                 useLibraryCodeForTypes = true,
            --                 inlayHints = {
            --                     variableTypes = true,
            --                     functionReturnTypes = true,
            --                     parameterNames = true,
            --                     parameterTypes = true,
            --                 },
            --             },
            --         },
            --     },
            -- })

            -- configure lua server (with special settings)
            lspconfig["lua_ls"].setup({
                capabilities = capabilities,
                on_attach = on_attach,
                settings = { -- custom settings for lua
                    Lua = {
                        hint = { enable = true },
                        -- make the language server recognize "vim" global
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
            -- lspconfig["marksman"].setup({
            --     capabilities = capabilities,
            --     on_attach = on_attach,
            -- })
        end,
    },
}
