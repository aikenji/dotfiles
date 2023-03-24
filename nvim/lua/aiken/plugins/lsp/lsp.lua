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

    -- import cmp-nvim-lsp plugin safely
    local cmp_nvim_lsp_status, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
    if not cmp_nvim_lsp_status then
        return
    end

    -- enable mason
    mason.setup()

    mason_lspconfig.setup({
        -- list of servers for mason to install
        ensure_installed = {
            "clangd",
            "pyright",
            "marksman",
        },
        -- auto-install configured servers (with lspconfig)
        automatic_installation = true, -- not the same as ensure_installed
    })

    local keymap = vim.keymap -- for conciseness

    -- enable keybinds only for when lsp server available
    local on_attach = function(client, bufnr)
        -- keybind options
        local opts = { noremap = true, silent = true, buffer = bufnr }

        -- set keybinds
        keymap.set("n", "gr", "<cmd>Lspsaga lsp_finder<CR>", opts) -- show definition, references
        keymap.set("n", "gD", "<Cmd>Lspsaga goto_definition<CR>", opts) -- got to declaration
        keymap.set("n", "gd", "<cmd>Lspsaga peek_definition<CR>", opts) -- see definition and make edits in window
        keymap.set("n", "ga", "<cmd>Lspsaga code_action<CR>", opts) -- see available code actions
        keymap.set("n", "gR", "<cmd>Lspsaga rename<CR>", opts) -- smart rename
        keymap.set("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts) -- jump to previous diagnostic in buffer
        keymap.set("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts) -- jump to next diagnostic in buffer
        keymap.set("n", "<leader>k", "<cmd>Lspsaga hover_doc<CR>", { noremap = true, desc = "Show Documentation" }) -- show documentation for what is under cursor
        keymap.set("n", "<leader>o", "<cmd>Lspsaga outline<CR>", { noremap = true, desc = "Outline" }) -- see outline on right hand side
        keymap.set("n", "<leader>d", "<cmd>Lspsaga show_line_diagnostics<CR>", { noremap = true, desc = "Diagnostics" }) -- show diagnostics
    end

    -- used to enable autocompletion (assign to every lsp server config)
    local capabilities = cmp_nvim_lsp.default_capabilities()

    -- Change the Diagnostic symbols in the sign column (gutter)
    -- (not in youtube nvim video)
    local signs = { Error = " ", Warn = " ", Hint = "ﴞ ", Info = " " }
    for type, icon in pairs(signs) do
        local hl = "DiagnosticSign" .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
    end

    -- configure cpp clangd
    lspconfig["clangd"].setup({
        capabilities = capabilities,
        on_attach = on_attach,
    })

    -- configure pyright server
    lspconfig["pyright"].setup({
        capabilities = capabilities,
        on_attach = on_attach,
        settings = {
            pyright = {
                autoImportCompletion = true,
                python = {
                    analysis = {
                        autoSearchPaths = true,
                        useLibraryCodeForTypes = true,
                    },
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
