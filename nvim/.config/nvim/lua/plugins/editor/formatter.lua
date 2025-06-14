return {
  { -- Autoformat
    "stevearc/conform.nvim",
    opts = {
      notify_on_error = true,
      format_on_save = function(bufnr)
        -- Disable "format_on_save lsp_fallback" for languages that don't
        -- have a well standardized coding style. You can add additional
        -- languages here or re-enable it for the disabled ones.
        local disable_filetypes = { c = true, cpp = true }
        local lsp_format_opt
        if disable_filetypes[vim.bo[bufnr].filetype] then
          lsp_format_opt = "never"
        else
          lsp_format_opt = "fallback"
        end
        return {
          timeout_ms = 500,
          lsp_format = lsp_format_opt,
        }
      end,
      formatters_by_ft = {
        lua = { "stylua" },
        python = { "black" },
        tex = { "tex_fmt" },
        markdown = { "prettierd" },
        json = { "prettierd" },
        yaml = { "prettierd" },
        bash = { "shfmt" },
        zsh = { "shfmt" },
      },

      formatters = {
        tex_fmt = {
          inherit = false,
          command = "tex-fmt",
          args = { "-t", "4", "--stdin" },
        },
      },
    },
  },
}
