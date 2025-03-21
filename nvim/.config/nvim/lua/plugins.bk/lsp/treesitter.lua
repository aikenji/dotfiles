local M = {}

function M.init()
    -- import nvim-treesitter plugin safely
    local ts_status, treesitter = pcall(require, "nvim-treesitter.configs")
    if not ts_status then
        return
    end

    -- configure treesitter
    treesitter.setup({
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
        -- use vimtex as syntax highlighting
        ignore_install = { "latex" },
        -- install sync
        sync_install = true,
        --Automatically install missing parsers
        auto_install = true,
        -- enable syntax highlighting
        highlight = {
            additional_vim_regex_highlighting = false,
            enable = true,
        },
        indent = {
            enable = true,
            disable = { "yaml", "python" },
        },

        incremental_selection = {
            enable = true,
            keymaps = {
                init_selection = "<cr>", -- set to `false` to disable one of the mappings
                node_incremental = "<cr>",
                scope_incremental = false,
                node_decremental = "<bs>",
            },
        },
    })
end

return M
