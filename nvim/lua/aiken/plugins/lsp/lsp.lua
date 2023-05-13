local M = {}

function M.init()
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
                package_uninstalled = " 󰚌",
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
            "marksman",
        },
    })

    -- used to enable autocompletion (assign to every lsp server config)
    local capabilities = cmp_nvim_lsp.default_capabilities()
    capabilities.offsetEncoding = "utf-16"

    -- enable keybinds only for when lsp server available
    local on_attach = function(client, bufnr)
        -- keybind options
        local keymap = vim.keymap -- for conciseness
        local opts = { noremap = true, silent = true, buffer = bufnr }

        -- set keybinds
        keymap.set("n", "gr", "<cmd>Lspsaga lsp_finder<CR>", opts) -- show definition, references
        keymap.set("n", "gD", "<cmd>Lspsaga goto_definition<CR>", opts) -- got to declaration
        keymap.set("n", "gd", "<cmd>Lspsaga peek_definition<CR>", opts) -- see definition and make edits in window
        keymap.set("n", "ga", "<cmd>Lspsaga code_action<CR>", opts) -- see available code actions
        keymap.set("n", "gR", "<cmd>Lspsaga rename<CR>", opts) -- smart rename
        keymap.set("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts) -- jump to previous diagnostic in buffer
        keymap.set("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts) -- jump to next diagnostic in buffer
        keymap.set("n", "<leader>k", "<cmd>Lspsaga hover_doc<CR>", { noremap = true, desc = "Show Documentation" }) -- show documentation for what is under cursor
        keymap.set("n", "<leader>o", "<cmd>Lspsaga outline<CR>", { noremap = true, desc = "Outline" }) -- see outline on right hand side
        keymap.set("n", "<leader>d", "<cmd>Lspsaga show_line_diagnostics<CR>", { noremap = true, desc = "Diagnostics" }) -- show diagnostics
    end

    -- Change the Diagnostic symbols in the sign column (gutter)
    local signs = { Error = " ", Warn = " ", Hint = "ﴞ ", Info = " " }
    for type, icon in pairs(signs) do
        local hl = "DiagnosticSign" .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
    end

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

    -- configure lua server (with special settings)
    lspconfig["lua_ls"].setup({
        capabilities = capabilities,
        on_attach = on_attach,
        settings = { -- custom settings for lua
            Lua = {
                -- make the language server recognize "vim" global
                diagnostics = {
                    globals = { "vim" },
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
    lspconfig["marksman"].setup({
        capabilities = capabilities,
        on_attach = on_attach,
    })
end

return M
