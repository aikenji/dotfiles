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

    -- load vs-code like snippets from plugins (e.g. friendly-snippets)
    require("luasnip/loaders/from_vscode").lazy_load()
    luasnip.setup({
        history = true,
        delete_check_events = "TextChanged",
    })

    -- keybinding for luasnip
    local keymap = vim.keymap
    keymap.set("i", "<tab>", function() -- expand sippets
        return luasnip.jumpable(1) and "<Plug>luasnip-jump-next" or "<tab>"
    end, { expr = true, silent = true, noremap = true })

    keymap.set("s", "<tab>", function() -- jump to next sippets node
        luasnip.jump(1)
    end)

    keymap.set({ "i", "s" }, "<s-tab>", function() -- jump to previous sippets node
        luasnip.jump(-1)
    end)

    cmp.setup({
        snippet = {
            expand = function(args)
                luasnip.lsp_expand(args.body)
            end,
        },
        window = {
            completion = cmp.config.window.bordered({ border = "rounded" }),
            documentation = cmp.config.window.bordered({
                border = { "╔", "═", "╗", "║", "╝", "═", "╚", "║" },
            }),
        },
        mapping = cmp.mapping.preset.insert({
            ["<C-k>"] = cmp.mapping.select_prev_item(), -- previous suggestion
            ["<C-j>"] = cmp.mapping.select_next_item(), -- next suggestion
            ["<C-u>"] = cmp.mapping.scroll_docs(-4),
            ["<C-d>"] = cmp.mapping.scroll_docs(4),
            ["<C-e>"] = cmp.mapping.abort(), -- close completion window
            ["<CR>"] = cmp.mapping.confirm({ select = true }),
        }),
        -- sources for autocompletion
        sources = cmp.config.sources({
            { name = "nvim_lsp" }, -- lsp
            { name = "luasnip" }, -- snippets
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
            }),
        },
    })
end

return M
