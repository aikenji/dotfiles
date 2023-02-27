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
  }
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
