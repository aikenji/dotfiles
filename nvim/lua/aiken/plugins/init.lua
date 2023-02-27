local plugins = {
  -- preferred colortheme
  {
    'folke/tokyonight.nvim', 
    config = function()
      require("aiken.plugins.tokyonight").init()
    end,
    lazy = false,
    -- colorschemes need high priority
    priority = 1000,
  },

  {
    -- file explorer
    'nvim-tree/nvim-tree.lua',
    dependencies = {'nvim-tree/nvim-web-devicons'}, -- optional, for file icons
    init = function()
      require("aiken.plugins.nvim-tree").init()
    end
  },

  {
    -- status line
    'nvim-lualine/lualine.nvim',
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
    'windwp/nvim-autopairs',
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
    'lewis6991/gitsigns.nvim', -- show line modifications on left hand side
    init = function()
      require("aiken.plugins.gitsigns").init()
    end
  },

  {
    -- fuzzy finding w/ telescope
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = {
      'nvim-lua/plenary.nvim', -- contains many useful lua functions
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" }, -- dependency for better sorting performance
    }, 
    init = function()
      require("aiken.plugins.telescope").init()
    end
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