local M = {}

function M.init()
    local dashboard = require("alpha.themes.dashboard")
    local logo = [[
    ███╗   ██╗  ███████╗   ██████╗   ██╗   ██╗  ██╗  ███╗   ███╗  
    ████╗  ██║  ██╔════╝  ██╔═══██╗  ██║   ██║  ██║  ████╗ ████║  
    ██╔██╗ ██║  █████╗    ██║   ██║  ██║   ██║  ██║  ██╔████╔██║  
    ██║╚██╗██║  ██╔══╝    ██║   ██║  ╚██╗ ██╔╝  ██║  ██║╚██╔╝██║  
    ██║ ╚████║  ███████╗  ╚██████╔╝   ╚████╔╝   ██║  ██║ ╚═╝ ██║  
    ╚═╝  ╚═══╝  ╚══════╝   ╚═════╝     ╚═══╝    ╚═╝  ╚═╝     ╚═╝  

                     ⟦ 𝔸 𝕚 𝕜 𝕖 𝕟 🚀 𝕍𝔼ℝ 1.0 ⟧                      
    ]]

    dashboard.section.header.val = vim.split(logo, "\n")
    dashboard.section.buttons.val = {
        dashboard.button("f", " " .. " Find file", ":Telescope find_files <CR>"),
        dashboard.button("n", " " .. " New file", ":ene <BAR> startinsert <CR>"),
        dashboard.button("r", " " .. " Recent files", ":Telescope oldfiles <CR>"),
        -- dashboard.button("g", " " .. " Find text", ":Telescope live_grep <CR>"),
        dashboard.button("c", " " .. " Config", ":e $HOME/.config/nvim/lua/aiken/plugins/init.lua<CR>"),
        dashboard.button("l", "󰒲 " .. " Lazy", ":Lazy<CR>"),
        dashboard.button("s", " " .. " Mason", ":Mason<CR>"),
        dashboard.button("m", " " .. " Bookmarks", ":Telescope marks<CR>"),
        dashboard.button("q", " " .. " Quit", ":qa<CR>"),
    }
    for _, button in ipairs(dashboard.section.buttons.val) do
        button.opts.hl = "AlphaButtons"
        button.opts.hl_shortcut = "AlphaShortcut"
    end
    dashboard.section.footer.opts.hl = "Type"
    dashboard.section.header.opts.hl = "AlphaHeader"
    dashboard.section.buttons.opts.hl = "AlphaButtons"
    dashboard.opts.layout[1].val = 8

    vim.api.nvim_set_hl(0, "AlphaHeader", { fg = "#ea76cb" })
    vim.api.nvim_set_hl(0, "AlphaButtons", { fg = "#f4b8e4" })

    -- close Lazy and re-open when the dashboard is ready
    if vim.o.filetype == "lazy" then
        vim.cmd.close()
        vim.api.nvim_create_autocmd("User", {
            pattern = "AlphaReady",
            callback = function()
                require("lazy").show()
            end,
        })
    end

    require("alpha").setup(dashboard.opts)

    -- show the cost time of plugins loading
    vim.api.nvim_create_autocmd("User", {
        pattern = "LazyVimStarted",
        callback = function()
            local stats = require("lazy").stats()
            local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
            dashboard.section.footer.val = "⚡ Neovim loaded " .. stats.count .. " plugins in " .. ms .. "ms"
            pcall(vim.cmd.AlphaRedraw)
        end,
    })
end

return M
