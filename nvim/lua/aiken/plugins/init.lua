local plugins = {
    -- preferred colortheme
    {
        "folke/tokyonight.nvim",
        config = function()
            require("aiken.plugins.tokyonight").init()
        end,
        lazy = false,
        -- colorschemes need high priority
        priority = 1000,
    },

    {
        -- dashboard of nvim
        "goolord/alpha-nvim",
        event = "VimEnter",
        config = function()
            require("aiken.plugins.alpha").init()
        end,
    },

    {
        -- ehanced vim.notify ui
        "folke/noice.nvim",
        dependencies = {
            "rcarriga/nvim-notify",
            "MunifTanjim/nui.nvim",
        },
        event = "VeryLazy",
        config = function()
            require("aiken.plugins.noice").init()
        end,
    },

    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v2.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
            "MunifTanjim/nui.nvim", -- file explorer
        },
        cmd = "NeoTree",
        init = function()
            require("aiken.plugins.neo-tree").init()
        end,
    },

    {
        -- better terminal
        "akinsho/toggleterm.nvim",
        version = "*",
        opts = {
            terminal_mappings = true,
            direction = "float",
        },
        config = function(_, opts)
            require("toggleterm").setup(opts)
        end,
    },

    {
        -- buffer line
        "akinsho/bufferline.nvim",
        version = "v3.*",
        enabled = true,
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            require("aiken.plugins.bufferline").init()
        end,
    },

    {
        -- status line
        "nvim-lualine/lualine.nvim",
        init = function()
            require("aiken.plugins.lualine").init()
        end,
    },

    {
        -- show indent line
        "lukas-reineke/indent-blankline.nvim",
        event = { "BufReadPost", "BufNewFile" },
        opts = {
            char = "|",
            filetype_exclude = { "help", "alpha", "dashboard", "neo-tree", "Trouble", "lazy" },
            show_trailing_blankline_indent = false,
            show_current_context = false,
        },
        config = function(_, opts)
            require("indent_blankline").setup(opts)
        end,
    },

    {
        -- show indent range
        "echasnovski/mini.indentscope",
        event = { "BufReadPre", "BufNewFile" },
        opts = {
            -- symbol = "▏",
            symbol = "│",
            options = { try_as_border = true },
        },
        init = function()
            vim.api.nvim_create_autocmd("FileType", {
                pattern = { "help", "alpha", "neo-tree", "dashboard", "Trouble", "lazy", "mason" },
                callback = function()
                    vim.b.miniindentscope_disable = true
                end,
            })
        end,
        config = function(_, opts)
            require("mini.indentscope").setup(opts)
        end,
    },
    {
        -- commenting with gc
        "numToStr/Comment.nvim",
        init = function()
            require("aiken.plugins.comment").init()
        end,
    },

    {
        -- auto closing
        "windwp/nvim-autopairs",
        event = "BufRead",
        config = function()
            require("aiken.plugins.autopairs").init()
        end,
    },

    {
        -- add, delete, change surroundings
        "kylechui/nvim-surround",
        config = true,
    },

    {
        -- git integration
        "lewis6991/gitsigns.nvim", -- show line modifications on left hand side
        init = function()
            require("aiken.plugins.gitsigns").init()
        end,
    },

    {
        -- show keymap list
        "folke/which-key.nvim",
        config = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
            require("which-key").setup()
        end,
    },

    {
        -- fuzzy finding w/ telescope
        "nvim-telescope/telescope.nvim",
        branch = "0.1.x",
        dependencies = {
            "nvim-lua/plenary.nvim", -- contains many useful lua functions
            { "nvim-telescope/telescope-fzf-native.nvim", build = "make" }, -- dependency for better sorting performance
        },
        init = function()
            require("aiken.plugins.telescope").init()
        end,
    },

    {
        -- easily configure language servers
        "neovim/nvim-lspconfig",
        dependencies = {
            "williamboman/mason.nvim", -- in charge of managing lsp servers, linters & formatters
            "williamboman/mason-lspconfig.nvim", -- bridges gap b/w mason & lspconfig
            "hrsh7th/cmp-nvim-lsp", -- for autocompletion
        },
        config = function()
            require("aiken.plugins.lsp.lsp").init()
        end,
    },

    {
        -- some extections on lsp
        "glepnir/lspsaga.nvim",
        config = function()
            require("aiken.plugins.lsp.lspsaga").init()
        end,
        dependencies = { "nvim-tree/nvim-web-devicons", "nvim-treesitter/nvim-treesitter" },
        event = "BufRead",
    },

    {
        -- treesitter
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        init = function()
            require("aiken.plugins.lsp.treesitter").init()
        end,
    },

    {
        -- autocompletion
        "hrsh7th/nvim-cmp",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer", -- source for text in buffer
            "hrsh7th/cmp-path", -- source for file system paths
            "onsails/lspkind-nvim", -- vs-code like icons for autocompletion
            -- snippets
            { "L3MON4D3/LuaSnip", build = "make install_jsregexp" },
            "saadparwaiz1/cmp_luasnip", -- for autocompletion
            "rafamadriz/friendly-snippets", -- useful snippets
        },
        event = "BufRead",
        config = function()
            require("aiken.plugins.lsp.completion").init()
        end,
    },

    {
        -- formatting and linting
        "jose-elias-alvarez/null-ls.nvim",
        dependencies = { "jay-babu/mason-null-ls.nvim" },
        config = function()
            require("aiken.plugins.lsp.null-ls").init()
        end,
    },

    {
        -- markdown-preview
        "iamcco/markdown-preview.nvim",
        build = "cd app && npm install",
        init = function()
            vim.g.mkdp_filetypes = { "markdown" }
        end,
        ft = { "markdown" },
    },
}

-- preload of lazy plugins

-- recommended settings from nvim-tree documentation
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- 24-bit color is required when using nvim-notify
vim.opt.termguicolors = true

-- auto install lazy if not installed
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup(plugins)

-- afterload of lazy plugins
