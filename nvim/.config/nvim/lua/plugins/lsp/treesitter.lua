return {
    { -- Highlight, edit, and navigate code
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        main = "nvim-treesitter.configs", -- Sets main module to use for opts
        opts = {
            ensure_installed = {
                "bash",
                "c",
                "cpp",
                "cmake",
                "python",
                "diff",
                "html",
                "lua",
                "luadoc",
                "markdown",
                "markdown_inline",
                "query",
                "json",
                "gitignore",
                "vim",
                "vimdoc",
            },

            -- Autoinstall languages that are not installed
            auto_install = true,
            ignore_install = { "latex" },
            highlight = {
                enable = true,
                additional_vim_regex_highlighting = { "ruby" },
            },
            indent = {
                enable = true,
                disable = {
                    "yaml",
                    "ruby",
                    "python",
                },
            },
        },
    },
}
