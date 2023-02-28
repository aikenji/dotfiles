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
    -- file explorer
    "nvim-tree/nvim-tree.lua",
    dependencies = {"nvim-tree/nvim-web-devicons"}, -- optional, for file icons
    init = function()
      require("aiken.plugins.nvim-tree").init()
    end
  },

  {
    -- buffer line 
    "akinsho/bufferline.nvim", version = "v3.*",
    enabled = false,
    dependencies = {'nvim-tree/nvim-web-devicons'},
    config = function()
      require("aiken.plugins.bufferline").init()
    end
  },

  {
    -- status line
    "nvim-lualine/lualine.nvim",
    init = function()
      require("aiken.plugins.lualine").init()
    end
  },

  {
    -- show indent line 
    "lukas-reineke/indent-blankline.nvim",
    config = true
  },

  {
    -- commenting with gc
    "numToStr/Comment.nvim",
    init = function()
      require("aiken.plugins.comment").init()
    end
  },

  {
    -- auto closing
    "windwp/nvim-autopairs",
    init = function()
      require("aiken.plugins.autopairs").init()
    end
  },

  {
    -- add, delete, change surroundings
    "kylechui/nvim-surround",
    config = true
  },

  {
    -- git integration
    "lewis6991/gitsigns.nvim", -- show line modifications on left hand side
    init = function()
      require("aiken.plugins.gitsigns").init()
    end
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
    end
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
    end
  },

  {
    -- some extections on lsp
    "glepnir/lspsaga.nvim",
    config = true,
    dependencies = {"nvim-tree/nvim-web-devicons", "nvim-treesitter/nvim-treesitter"},
    event = "BufRead",
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
      {"L3MON4D3/LuaSnip", version = "<CurrentMajor>.*", build = "make install_jsregexp"},
      "saadparwaiz1/cmp_luasnip", -- for autocompletion
      "rafamadriz/friendly-snippets" -- useful snippets
    },
    config = function()
        require("aiken.plugins.lsp.completion").init()
    end,
  },

}

-- preload of lazy plugins

-- recommended settings from nvim-tree documentation
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

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

-- change color for arrows in nvim-tree to light blue
vim.cmd([[ highlight NvimTreeIndentMarker guifg=#3FC5FF ]])
