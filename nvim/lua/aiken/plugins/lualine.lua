local M = {}

function M.init()
    -- import lualine plugin safely
    local status, lualine = pcall(require, "lualine")
    if not status then
        return
    end

    -- new colors for theme
    local new_colors = {
        blue = "#65D1FF",
        green = "#3EFFDC",
        violet = "#FF61EF",
        yellow = "#FFDA7B",
        black = "#000000",
        uiuc_blue = "#13294B",
        uiuc_orange = "#E84A27",
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
            return { fg = ts and not vim.tbl_isempty(ts) and new_colors.green or new_colors.red }
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
        color = { gui = "bold", fg = new_colors.green, bg = "black" },
    }

    -- configure lualine with modified theme
    lualine.setup({
        options = {
            theme = "tokyonight",
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
                    icon = { "", color = { fg = new_colors.yellow } },
                },
                "diff",
                "diagnostics",
            },

            lualine_c = {
                {
                    "filename",
                    path = 1, -- show relative path
                    shrting_target = 50,
                    color = { fg = new_colors.blue },
                    -- show lspsaga symbolwinbar
                    -- function()
                    --     return require("lspsaga.symbolwinbar"):get_winbar()
                    -- end,
                },
            },
            lualine_x = {
                indent,
                lsp,
                "filetype",
            },
        },
    })
end

return M
