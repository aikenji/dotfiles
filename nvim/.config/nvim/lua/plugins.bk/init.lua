local plugins = {

    -- PERF:
    {
        -- navigate between tmux and vim
        "christoomey/vim-tmux-navigator",
        lazy = false,
    },

    -- PERF:
    {
        "echasnovski/mini.animate",
        version = "*",
        opts = {
            cursor = { enable = false },
        },
        config = function(_, opts)
            require("mini.animate").setup(opts)
        end,
    },

    -- PERF:
    {
        "folke/zen-mode.nvim",
        opts = {
            window = {
                backdrop = 0.15,
            },
        },
    },

    -- PERF:
    {
        "folke/twilight.nvim",
        opts = {},
    },

    {
        -- treesitter
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function()
            require("plugins.lsp.treesitter").init()
        end,
    },

    -- PERF:
    {
        -- navigate code easily
        "folke/flash.nvim",
        event = "VeryLazy",
        opts = {
            prompt = {
                prefix = { { " JUMP", "FlashPromptIcon" } },
            }, -- use default configs
        },
        keys = {
            {
                "s",
                mode = { "n", "x", "o" },
                function()
                    require("flash").jump()
                end,
                desc = "Flash",
            },
            {
                "S",
                mode = { "n", "o", "x" },
                function()
                    require("flash").treesitter()
                end,
                desc = "Flash Treesitter",
            },
        },
    },

    -- PERF:
    {
        -- colorscheme catppuccin
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
        config = function()
            require("plugins.catppuccin").init()
        end,
    },

    {
        -- colorscheme tokyonight
        "folke/tokyonight.nvim",
        config = function()
            require("plugins.tokyonight").init()
        end,
        enabled = false,
        lazy = false,
        -- colorschemes need high priority
        priority = 1000,
    },

    {
        -- colorizer
        -- TODO: some buftypes need disable
        "NvChad/nvim-colorizer.lua",
        config = function()
            require("colorizer").setup()
        end,
    },

    -- PERF:
    {
        -- highlight todo comment
        "folke/todo-comments.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        opts = {},
    },

    -- PERF:
    {
        -- dashboard of nvim
        "goolord/alpha-nvim",
        event = "VimEnter",
        config = function()
            require("plugins.alpha").init()
        end,
    },

    -- PERF:
    {
        -- ehanced vim.notify ui
        "folke/noice.nvim",
        dependencies = {
            "rcarriga/nvim-notify",
            "MunifTanjim/nui.nvim",
        },
        event = "VeryLazy",
        config = function()
            require("plugins.noice").init()
        end,
    },

    -- PERF:
    {
        -- file manager
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v2.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
            "MunifTanjim/nui.nvim", -- file explorer
        },
        cmd = "NeoTree",
        init = function()
            require("plugins.neo-tree").init()
        end,
    },

    -- PERF:
    {
        -- buffer line
        "akinsho/bufferline.nvim",
        version = "*",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            require("plugins.bufferline").init()
        end,
    },

    -- PERF:
    {
        -- status line
        "nvim-lualine/lualine.nvim",
        init = function()
            require("plugins.lualine").init()
        end,
    },

    -- PERF:
    {
        -- show indent line
        "lukas-reineke/indent-blankline.nvim",
        event = { "BufReadPost", "BufNewFile" },
        opts = {
            scope = {},
            -- filetype_exclude = { "help", "alpha", "dashboard", "neo-tree", "Trouble", "lazy" },
            -- show_trailing_blankline_indent = false,
        },
        config = function(_, opts)
            require("ibl").setup(opts)
        end,
    },

    {
        -- commenting with <leader>/
        "numToStr/Comment.nvim",
        init = function()
            require("plugins.comment").init()
        end,
    },

    {
        -- add, delete, change surroundings
        -- TODO: find some better keymapings
        "echasnovski/mini.surround",
        version = "*",
        config = function()
            require("plugins.surround").init()
        end,
    },

    -- PERF:
    {
        -- git integration
        "lewis6991/gitsigns.nvim", -- show line modifications on left hand side
        init = function()
            require("plugins.gitsigns").init()
        end,
    },

    -- PERF:
    {
        -- show keymap list
        "folke/which-key.nvim",
        config = function()
            require("plugins.whichkey").init()
        end,
    },

    -- PERF:
    {
        -- fuzzy finding w/ telescope
        "nvim-telescope/telescope.nvim",
        branch = "0.1.x",
        dependencies = {
            "nvim-lua/plenary.nvim", -- contains many useful lua functions
            { "nvim-telescope/telescope-fzf-native.nvim", build = "make" }, -- dependency for better sorting performance
        },
        init = function()
            require("plugins.telescope").init()
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
            require("plugins.lsp.lsp").init()
        end,
    },

    {
        -- some extensions on lsp
        "glepnir/lspsaga.nvim",
        event = "BufRead",
        dependencies = { "nvim-tree/nvim-web-devicons", "nvim-treesitter/nvim-treesitter" },
        config = function()
            require("plugins.lsp.lspsaga").init()
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
            { "L3MON4D3/LuaSnip", version = "v2.*", build = "make install_jsregexp" },
            "saadparwaiz1/cmp_luasnip", -- for autocompletion
            "rafamadriz/friendly-snippets", -- useful snippets
        },
        event = "BufRead",
        config = function()
            require("plugins.lsp.cmp").init()
        end,
    },

    {
        -- formatting and linting
        "jose-elias-alvarez/null-ls.nvim",
        dependencies = { "jay-babu/mason-null-ls.nvim" },
        config = function()
            require("plugins.lsp.null-ls").init()
        end,
    },

    -- PERF:
    {
        "MeanderingProgrammer/render-markdown.nvim",
        dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },
        opts = {
            sign = { enabled = false },
            completions = { lsp = { enabled = true } },
            code = {
                width = "block",
                min_width = 45,
            },
        },
    },

    -- PERF:
    {
        "iamcco/markdown-preview.nvim",
        cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
        build = "cd app && yarn install",
        init = function()
            vim.g.mkdp_filetypes = { "markdown" }
        end,
        ft = { "markdown" },
    },

    -- PERF:
    {
        "epwalsh/obsidian.nvim",
        version = "*", -- recommended, use latest release instead of latest commit
        lazy = true,
        ft = "markdown",
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
        opts = {
            workspaces = {
                {
                    name = "second-brain",
                    path = "~/Notes/second-brain/",
                },
            },
            ui = { enable = false },
        },
    },

    -- PERF:
    {
        -- latex-preview setup
        "lervag/vimtex",
        init = function()
            require("plugins.vimtex").init()
        end,
    },
}

-- preload of lazy plugins

-- mini.animate scroll bugs when using mouse
vim.o.mousescroll = "ver:1,hor:1"

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
