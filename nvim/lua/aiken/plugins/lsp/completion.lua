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

    vim.opt.completeopt = "menu,menuone,noselect"

    cmp.setup({
        snippet = {
            expand = function(args)
                luasnip.lsp_expand(args.body)
            end,
        },
        window = {
            completion = cmp.config.window.bordered(),
            documentation = cmp.config.window.bordered(),
        },
        mapping = cmp.mapping.preset.insert({
            ["<C-k>"] = cmp.mapping.select_prev_item(), -- previous suggestion
            ["<C-j>"] = cmp.mapping.select_next_item(), -- next suggestion
            ["<C-b>"] = cmp.mapping.scroll_docs(-4),
            ["<C-f>"] = cmp.mapping.scroll_docs(4),
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
            fields = { "kind", "abbr", "menu" },
            format = lspkind.cmp_format({
                -- mode = "symbol",
                maxwidth = 50,
                ellipsis_char = "...",
            }),
            source_names = {
                nvim_lsp = "(LSP)",
                emoji = "(Emoji)",
                path = "(Path)",
                calc = "(Calc)",
                cmp_tabnine = "(Tabnine)",
                vsnip = "(Snippet)",
                luasnip = "(Snippet)",
                buffer = "(Buffer)",
                tmux = "(TMUX)",
                copilot = "(Copilot)",
                treesitter = "(TreeSitter)",
            },
        },
    })
end

return M
