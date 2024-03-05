if vim.g.neovide then
    -- fonts
    vim.o.guifont = "JetBrainsMono Nerd Font:h16" -- text below applies for VimScript
    -- padding
    vim.g.neovide_padding_top = 1.2
    vim.g.neovide_padding_bottom = 1.2
    vim.g.neovide_padding_right = 1.2
    vim.g.neovide_padding_left = 1.2
    -- scale factor
    vim.g.neovide_scale_factor = 1.0

    -- transparency of background
    local alpha = function()
        return string.format("%x", math.floor((255 * vim.g.transparency) or 0.8))
    end
    -- g:neovide_transparency should be 0 if you want to unify transparency of content and title bar.
    vim.g.neovide_transparency = 1.0
    vim.g.transparency = 1.0
    vim.g.neovide_background_color = "#0f1117" .. alpha()
    vim.g.neovide_transparency = 0.8

    -- blur of floating windows
    vim.g.neovide_floating_blur_amount_x = 2.0
    vim.g.neovide_floating_blur_amount_y = 2.0
end
