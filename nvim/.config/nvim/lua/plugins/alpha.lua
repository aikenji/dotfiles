local M = {}

function M.init()
    local dashboard = require("alpha.themes.dashboard")
    -- local logo = [[
    -- ███╗   ██╗  ███████╗   ██████╗   ██╗   ██╗  ██╗  ███╗   ███╗
    -- ████╗  ██║  ██╔════╝  ██╔═══██╗  ██║   ██║  ██║  ████╗ ████║
    -- ██╔██╗ ██║  █████╗    ██║   ██║  ██║   ██║  ██║  ██╔████╔██║
    -- ██║╚██╗██║  ██╔══╝    ██║   ██║  ╚██╗ ██╔╝  ██║  ██║╚██╔╝██║
    -- ██║ ╚████║  ███████╗  ╚██████╔╝   ╚████╔╝   ██║  ██║ ╚═╝ ██║
    -- ╚═╝  ╚═══╝  ╚══════╝   ╚═════╝     ╚═══╝    ╚═╝  ╚═╝     ╚═╝
    --
    --                  ⟦ 𝔸 𝕚 𝕜 𝕖 𝕟 🚀 𝕍𝔼ℝ 1.1 ⟧
    -- ]]
    -- dashboard.section.header.val = vim.split(logo, "\n")

    -- local logo1 = {
    --     [[          ▀████▀▄▄              ▄█ ]],
    --     [[            █▀    ▀▀▄▄▄▄▄    ▄▄▀▀█ ]],
    --     [[    ▄        █          ▀▀▀▀▄  ▄▀  ]],
    --     [[   ▄▀ ▀▄      ▀▄              ▀▄▀  ]],
    --     [[  ▄▀    █     █▀   ▄█▀▄      ▄█    ]],
    --     [[  ▀▄     ▀▄  █     ▀██▀     ██▄█   ]],
    --     [[   ▀▄    ▄▀ █   ▄██▄   ▄  ▄  ▀▀ █  ]],
    --     [[    █  ▄▀  █    ▀██▀    ▀▀ ▀▀  ▄▀  ]],
    --     [[   █   █  █      ▄▄           ▄▀   ]],
    --     [[                                   ]],
    --     [[      ⟦ 𝔸 𝕚 𝕜 𝕖 𝕟 🚀 𝕍𝔼ℝ 1.1 ⟧     ]],
    -- }
    --
    -- dashboard.section.header.val = logo1
    -- dashboard.section.header.opts.hl = "AlphaHeader"
    -- vim.api.nvim_set_hl(0, "AlphaHeader", { fg = "#ea76cb" })

    -- read Image.txt
    local function readImage(filePath)
        local file = io.open(filePath, "r") -- Open the file in read mode
        if not file then
            print("Error opening file")
            return nil
        end
        local content = file:read("*a")
        file:close()
        return content
    end

    -- extract content surrounded by [[ and ]]
    local function extractImage(content)
        -- Pattern to match content between [[ and ]]
        local pattern = "%[%[(.-)%]%]"
        local extracted = {}
        -- Iterate through all matches in the content
        for line in content:gmatch(pattern) do
            table.insert(extracted, line)
        end
        return extracted
    end

    -- Function to process the lines and load only those not starting with [[ into Lua
    local function extractColor(content)
        -- Split content into lines
        local lines = {}
        for line in content:gmatch("[^\r\n]+") do
            table.insert(lines, line)
        end

        local vim_lines = {}
        local code_lines = {}

        -- Separate lines based on their content
        for _, line in ipairs(lines) do
            if not line:match("^%[%[") then
                if line:match("^vim") then
                    table.insert(vim_lines, line)
                else
                    table.insert(code_lines, line)
                end
            end
        end

        -- Process lines that begin with vim
        for _, vim_line in ipairs(vim_lines) do
            local func, err = load(vim_line)
            if func then
                func()
            else
                print("Error loading vim line: " .. err)
            end
        end

        -- Concatenate and process other lines without newlines
        local code_content = table.concat(code_lines)
        local func, err = load(code_content, nil, "t", { dashboard = require("alpha.themes.dashboard") })
        if func then
            func()
        else
            print("Error loading concatenated code: " .. err)
        end
    end

    local filePath1 = os.getenv("HOME") .. "/.config/nvim/dashboard/waddle.txt"
    -- read the logo part of img.txt
    local img = readImage(filePath1)
    local imgv = extractImage(img)
    dashboard.section.header.val = imgv
    -- read the color part of img.txt
    extractColor(img)

    dashboard.section.buttons.val = {
        dashboard.button("f", " " .. " Find file", ":Telescope find_files <CR>"),
        dashboard.button("n", " " .. " New file", ":ene <BAR> startinsert <CR>"),
        dashboard.button("r", " " .. " Recent files", ":Telescope oldfiles <CR>"),
        -- dashboard.button("g", " " .. " Find text", ":Telescope live_grep <CR>"),
        dashboard.button("c", " " .. " Config", ":e $HOME/.config/nvim/lua/plugins/init.lua<CR>"),
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
    dashboard.section.buttons.opts.hl = "AlphaButtons"
    dashboard.opts.layout[1].val = 8

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
