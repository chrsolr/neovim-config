local options = {
  notify_on_error = true,

  format_on_save = function(bufnr)
    -- Disable "format_on_save lsp_fallback" for languages that don't
    -- have a well standardized coding style. You can add additional
    -- languages here or re-enable it for the disabled ones.
    local disable_filetypes = { c = true, cpp = true }
    local lsp_format_opt
    if disable_filetypes[vim.bo[bufnr].filetype] then
      lsp_format_opt = 'never'
    else
      lsp_format_opt = 'fallback'
    end
    return {
      timeout_ms = 500,
      lsp_format = lsp_format_opt,
    }
  end,

  formatters_by_ft = {
    javascript = { 'prettier', 'prettierd', stop_after_first = true },
    typescript = { 'prettier', 'prettierd', stop_after_first = true },
    javascriptreact = { 'prettier', 'prettierd', stop_after_first = true },
    typescriptreact = { 'prettier', 'prettierd', stop_after_first = true },
    json = { 'prettier', 'prettierd', stop_after_first = true },
    html = { 'prettier', 'prettierd', stop_after_first = true },
    yaml = { 'prettier', 'prettierd', stop_after_first = true },
    css = { 'prettierd', 'prettierd', stop_after_first = true },
    lua = { 'stylua' },
    toml = { 'taplo' },
    cs = { 'csharpier' },
    sql = { 'sql_formatter' },
  },

  formatters = {
    sql_formatter = {
      command = 'sql_formatter',
      stdin = true,
      args = {
        '-c',
        '{ "expressionWidth": 81, "tabWidth": 2, "keywordCase": "upper", "language": "postgresql" }',
      },
    },
  },
}

return options
