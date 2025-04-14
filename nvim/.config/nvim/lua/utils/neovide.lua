if vim.g.neovide then
  -- basic options of neovim for bluring
  vim.opt.winblend = 50
  vim.opt.pumblend = 65
  -- require("telescope").setup({
  --     defaults = {
  --         winblend = 50,
  --     },
  -- })
  -- basic settings for paste in neovide
  vim.keymap.set("v", "<D-c>", '"+y') -- Copy
  vim.keymap.set("n", "<D-v>", '"+P') -- Paste normal mode
  vim.keymap.set("v", "<D-v>", '"+P') -- Paste visual mode
  vim.keymap.set("c", "<D-v>", "<C-R>+") -- Paste command mode
  vim.keymap.set("i", "<D-v>", '<ESC>l"+Pli') -- Paste insert mode

  -- Allow clipboard copy paste in neovim
  vim.api.nvim_set_keymap("", "<D-v>", "+p<CR>", { noremap = true, silent = true })
  vim.api.nvim_set_keymap("!", "<D-v>", "<C-R>+", { noremap = true, silent = true })
  vim.api.nvim_set_keymap("t", "<D-v>", "<C-R>+", { noremap = true, silent = true })
  vim.api.nvim_set_keymap("v", "<D-v>", "<C-R>+", { noremap = true, silent = true })

  -- padding
  vim.g.neovide_padding_top = 30.0
  vim.g.neovide_padding_bottom = 30.0
  vim.g.neovide_padding_right = 10.0
  vim.g.neovide_padding_left = 10.0
  -- scale factor
  vim.g.neovide_scale_factor = 1.0
  -- contrast and gamma
  vim.g.neovide_text_gamma = 0.0
  vim.g.neovide_text_contrast = 0.5

  -- transparency of background
  vim.g.neovide_transparency = 0.5
  vim.g.neovide_window_blurred = true

  -- blur and shadow of floating windows
  vim.g.neovide_floating_blur = true
  vim.g.neovide_floating_blur_amount_x = 8.0
  vim.g.neovide_floating_blur_amount_y = 8.0
  vim.g.neovide_floating_shadow = true
  vim.g.neovide_floating_z_height = 10
  vim.g.neovide_light_angle_degrees = 45
  vim.g.neovide_light_radius = 5

  -- show borders
  vim.g.neovide_show_border = true

  -- cursor settings
  vim.g.neovide_hide_mouse_when_typing = true
  vim.g.neovide_cursor_animate_in_insert_mode = true
  vim.g.neovide_cursor_animate_command_line = true
  vim.g.neovide_cursor_smooth_blink = true

  -- particle settings
  vim.g.neovide_cursor_vfx_mode = "torpedo"
  vim.g.neovide_cursor_vfx_opacity = 500.0
  vim.g.neovide_cursor_vfx_particle_lifetime = 1.2
  vim.g.neovide_cursor_vfx_particle_density = 16.0
end
