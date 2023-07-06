local M = {}

function M.init()
    -- import nvim-treesitter plugin safely
    local ts_status, treesitter = pcall(require, "nvim-treesitter.configs")
    if not ts_status then
        return
    end
    -- import treesitter-context plugin safely
    local tscontext_status, ts_context = pcall(require, "treesitter-context")
    if not tscontext_status then
        return
    end

    -- configure treesitter
    treesitter.setup({
        -- enable syntax highlighting
        highlight = {
            enable = true,
            use_languagetree = true,
            additional_vim_regex_highlighting = false,
        },
        indent = { enable = true, disable = { "yaml", "python" } },

        incremental_selection = {
            enable = true,
            keymaps = {
                init_selection = "<cr>", -- set to `false` to disable one of the mappings
                node_incremental = "<cr>",
                scope_incremental = false,
                node_decremental = "<bs>",
            },
        },
        -- ensure these language parsers are installed
        ensure_installed = {
            "c",
            "cpp",
            "cmake",
            "python",
            "markdown",
            "markdown_inline",
            "bash",
            "lua",
            "json",
            "vim",
            "gitignore",
        },
        --Automatically install missing parsers
        auto_install = true,

        -- rainbow setup
        rainbow = {
            enable = true,
            -- list of languages you want to disable the plugin for
            -- disable = { 'jsx', 'cpp' },
            -- Which query to use for finding delimiters
            query = "rainbow-parens",
            -- Highlight the entire buffer all at once
            strategy = require("ts-rainbow").strategy.global,
        },
    })

    ts_context.setup({
        separator = "_",
        line_numbers = false,
    })
end

return M
