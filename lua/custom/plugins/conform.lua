local options = {
  notify_on_error = false,
  formatters_by_ft = {
    javascript = { 'biome', 'prettierd', stop_after_first = true },
    typescript = { 'biome', 'prettierd', stop_after_first = true },
    javascriptreact = { 'biome', 'prettierd', stop_after_first = true },
    typescriptreact = { 'biome', 'prettierd', stop_after_first = true },
    css = { 'biome', 'prettierd', stop_after_first = true },
    tailwindcss = { 'biome', 'prettierd', stop_after_first = true },
    html = { 'biome', 'prettierd', stop_after_first = true },
    json = { 'biome', 'prettierd', stop_after_first = true },
    yaml = { 'biome', 'prettierd', stop_after_first = true },
    markdown = { 'biome', 'prettierd', stop_after_first = true },
    lua = { 'stylua' },
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
