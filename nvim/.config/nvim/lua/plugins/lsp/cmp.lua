local M = {}

function M.init()
    -- import nvim-cmp plugin safely
    local cmp_status, cmp = pcall(require, "cmp")
    if not cmp_status then
        return
    end

    -- import luasnip plugin safely
    local luasnip_status, luasnip = pcall(require, "luasnip")
    if not luasnip_status then
        return
    end

    -- import lspkind plugin safely
    local lspkind_status, lspkind = pcall(require, "lspkind")
    if not lspkind_status then
        return
    end

    local keymap = vim.keymap

    --------------------
    -- LUASNIP SETUP
    --------------------
    luasnip.setup({
        -- Enable autotriggered snippets
        enable_autosnippets = true,
        -- Use Tab (or some other key if you prefer) to trigger visual selection
        store_selection_keys = "<Tab>",
        history = true,
        update_events = { "TextChanged", "TextChangedI" },
    })

    -- load snippets form ~/.config/nvim/snippets/
    require("luasnip.loaders.from_lua").lazy_load({ paths = "~/.config/nvim/snippets/" })
    -- load vs-code like snippets from plugins (e.g. friendly-snippets)
    -- require("luasnip.loaders.from_vscode").lazy_load()

    -- keybinding for luasnip

    keymap.set({ "i", "s" }, "<S-Tab>", function()
        luasnip.jump(1)
    end, { silent = true })

    -- keymap.set({ "i", "s" }, "<S-Tab>", function()
    --     luasnip.jump(-1)
    -- end, { silent = true })

    --------------------
    -- CMP SETUP
    --------------------

    -- color setup for cmp
    vim.api.nvim_set_hl(0, "CmpItemAbbrMatch", { fg = "#dcd8a3", bold = true })
    vim.api.nvim_set_hl(0, "CmpItemAbbrMatchFuzzy", { fg = "#04a5e5", bold = true })
    vim.api.nvim_set_hl(0, "CmpItemKindSnippet", { fg = "#ca9ee6" })
    -- cmp setup
    cmp.setup({
        snippet = {
            expand = function(args)
                luasnip.lsp_expand(args.body)
            end,
        },
        window = {
            completion = cmp.config.window.bordered({
                border = "rounded",
            }),
            documentation = cmp.config.window.bordered({
                border = { "╔", "═", "╗", "║", "╝", "═", "╚", "║" },
            }),
        },
        performance = {
            max_view_entries = 12,
        },
        mapping = cmp.mapping.preset.insert({
            ["<C-p>"] = cmp.mapping.select_prev_item(), -- previous suggestion
            ["<C-n>"] = cmp.mapping.select_next_item(), -- next suggestion
            ["<C-e>"] = cmp.mapping.abort(), -- close completion window
            ["<CR>"] = cmp.mapping.confirm({ select = true }),
        }),
        -- sources for autocompletion
        sources = cmp.config.sources({
            { name = "nvim_lsp" }, -- lsp
            { name = "luasnip", priority = 9 }, -- snippets
            { name = "buffer", keyword_length = 3 }, -- text within current buffer
            { name = "path", keyword_length = 2 }, -- file system paths
        }),
        -- configure lspkind for vs-code like icons
        formatting = {
            fields = { "abbr", "kind", "menu" },
            format = lspkind.cmp_format({
                mode = "symbol_text",
                maxwidth = 40,
                ellipsis_char = "...",
                menu = {
                    buffer = "󱞶 Buf",
                    nvim_lsp = "󱞶 LSP",
                    luasnip = "󱞶 Snip",
                    path = "󱞶 Path",
                },
            }),
        },
    })
end

return M
