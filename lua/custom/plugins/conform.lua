local options = {
  notify_on_error = true,
  formatters_by_ft = {
    javascript = { { 'prettierd' } },
    typescript = { { 'prettierd' } },
    javascriptreact = { { 'prettierd' } },
    typescriptreact = { { 'prettierd' } },
    css = { { 'prettierd' } },
    tailwindcss = { { 'prettierd' } },
    html = { { 'prettierd' } },
    json = { { 'prettierd' } },
    yaml = { { 'prettierd' } },
    markdown = { { 'prettierd' } },
    lua = { { 'stylua' } },
    toml = { 'taplo' },
    cs = { 'csharpier' },
    sql = { 'sql_formatter' },
  },
  formatters = {
    sql_formatter = {
      command = 'sql-formatter',
      args = {
        '-c',
        '{ "expressionWidth": 80, "tabWidth": 2, "keywordCase": "upper", "language": "postgresql" }',
      },
      stdin = true,
    },
  },
  format_on_save = {
    lsp_fallback = true,
    async = false,
    timeout_ms = 500,
  },
}

return {
  'stevearc/conform.nvim',
  event = {
    'BufReadPre',
    'BufNewFile',
  },
  opts = options,
}
