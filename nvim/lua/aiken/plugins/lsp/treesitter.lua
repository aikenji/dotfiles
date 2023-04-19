local M = {}

function M.init()
    -- import nvim-treesitter plugin safely
    local status, treesitter = pcall(require, "nvim-treesitter.configs")
    if not status then
        return
    end

    -- configure treesitter
    treesitter.setup({
        -- enable syntax highlighting
        highlight = {
            enable = true,
            additional_vim_regex_highlighting = true,
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
    })
end

return M
