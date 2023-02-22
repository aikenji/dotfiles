return {
 
  -- fuzzy finding w/ telescope
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = {
    'nvim-lua/plenary.nvim', -- contains many useful lua functions
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" }, -- dependency for better sorting performance
  }, 

  config = function()
    -- import telescope plugin safely
    local telescope_setup, telescope = pcall(require, "telescope")
    if not telescope_setup then
      return
    end

    -- import telescope actions safely
    local actions_setup, actions = pcall(require, "telescope.actions")
    if not actions_setup then
      return
    end

    -- configure telescope
    telescope.setup({})

    telescope.load_extension("fzf")
  end
  
 } 
