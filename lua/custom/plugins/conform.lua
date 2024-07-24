local options = {
  notify_on_error = false,
  format_on_save = function(bufnr)
    -- Disable "format_on_save lsp_fallback" for languages that don't
    -- have a well standardized coding style. You can add additional
    -- languages here or re-enable it for the disabled ones.
    local disable_filetypes = { c = true, cpp = true }
    return {
      timeout_ms = 500,
      lsp_fallback = not disable_filetypes[vim.bo[bufnr].filetype],
    }
  end,
  formatters_by_ft = {
    javascript = { 'prettierd', 'biome', stop_after_first = true },
    typescript = { 'prettierd', 'biome', stop_after_first = true },
    javascriptreact = { 'prettierd', 'biome', stop_after_first = true },
    typescriptreact = { 'prettierd', 'biome', stop_after_first = true },
    css = { 'prettierd', 'biome', stop_after_first = true },
    tailwindcss = { 'prettierd', 'biome', stop_after_first = true },
    html = { 'prettierd', 'biome', stop_after_first = true },
    json = { 'prettierd', 'biome', stop_after_first = true },
    yaml = { 'prettierd', 'biome', stop_after_first = true },
    markdown = { 'prettierd', 'biome', stop_after_first = true },
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
}

return {
  'stevearc/conform.nvim',
  -- event = {
  --   'BufReadPre',
  --   'BufNewFile',
  -- },
  event = {
    'BufWritePre',
  },
  cmd = { 'ConformInfo' },
  opts = options,
}
