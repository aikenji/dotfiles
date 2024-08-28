local M = {}

function M.init()
    -- import lualine plugin safely
    local status, lualine = pcall(require, "lualine")
    if not status then
        return
    end

    -- new colors for theme
    local tn_color = {
        none = "NONE",
        bg_dark = "#1f2335",
        bg = "#24283b",
        bg_highlight = "#292e42",
        terminal_black = "#414868",
        fg = "#c0caf5",
        fg_dark = "#a9b1d6",
        fg_gutter = "#3b4261",
        dark3 = "#545c7e",
        comment = "#565f89",
        dark5 = "#737aa2",
        blue0 = "#3d59a1",
        blue = "#7aa2f7",
        cyan = "#7dcfff",
        blue1 = "#2ac3de",
        blue2 = "#0db9d7",
        blue5 = "#89ddff",
        blue6 = "#b4f9f8",
        blue7 = "#394b70",
        magenta = "#bb9af7",
        magenta2 = "#ff007c",
        purple = "#9d7cd8",
        orange = "#ff9e64",
        yellow = "#e0af68",
        green = "#9ece6a",
        green1 = "#73daca",
        green2 = "#41a6b5",
        teal = "#1abc9c",
        red = "#f7768e",
        red1 = "#db4b4b",
    }

    -- tab component
    local indent = {
        function()
            local shiftwidth = vim.api.nvim_buf_get_option(0, "shiftwidth")
            return "󰌒 " .. " " .. shiftwidth
        end,
        padding = 1,
    }

    local treesitter = {
        function()
            return " "
        end,
        color = function()
            local buf = vim.api.nvim_get_current_buf()
            local ts = vim.treesitter.highlighter.active[buf]
            return { fg = ts and not vim.tbl_isempty(ts) and tn_color.green or tn_color.red }
        end,
    }

    local lsp = {
        function(msg)
            msg = msg or "LS Inactive"
            local buf_clients = vim.lsp.buf_get_clients()
            if next(buf_clients) == nil then
                -- TODO: clean up this if statement
                if type(msg) == "boolean" or #msg == 0 then
                    return "LS Inactive"
                end
                return msg
            end
            local buf_ft = vim.bo.filetype
            local buf_client_names = {}
            local copilot_active = false

            -- add client
            for _, client in pairs(buf_clients) do
                if client.name ~= "null-ls" and client.name ~= "copilot" then
                    table.insert(buf_client_names, client.name)
                end

                if client.name == "copilot" then
                    copilot_active = true
                end
            end

            -- -- add formatter
            -- local formatters = require("lvim.lsp.null-ls.formatters")
            -- local supported_formatters = formatters.list_registered(buf_ft)
            -- vim.list_extend(buf_client_names, supported_formatters)
            --
            -- -- add linter
            -- local linters = require("lvim.lsp.null-ls.linters")
            -- local supported_linters = linters.list_registered(buf_ft)
            -- vim.list_extend(buf_client_names, supported_linters)

            local unique_client_names = vim.fn.uniq(buf_client_names)

            local language_servers = "  " .. table.concat(unique_client_names, ", ")

            return language_servers
        end,
        color = { gui = "bold", fg = tn_color.green, bg = tn_color.bg },
    }

    -- configure lualine with modified theme
    lualine.setup({
        options = {
            theme = "catppuccin",
            component_separators = { left = "", right = "" },
            section_separators = { left = "", right = "" },
            disabled_filetypes = {
                statusline = { "neo-tree", "alpha", "dashboard", "lspsagaoutline" },
            },
        },
        sections = {
            lualine_b = {
                {
                    "branch",
                    icon = { "", color = { fg = tn_color.yellow } },
                },
                "diff",
                "diagnostics",
            },

            lualine_c = {
                {
                    "filename",
                    path = 1, -- show relative path
                    shrting_target = 50,
                    color = { fg = tn_color.blue },
                    -- show lspsaga symbolwinbar
                    -- function()
                    --     return require("lspsaga.symbolwinbar"):get_winbar()
                    -- end,
                },
            },
            lualine_x = {
                indent,
                "filetype",
                lsp,
            },
        },
    })
end

return M
