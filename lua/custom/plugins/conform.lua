return {
  'stevearc/conform.nvim',
  event = {
    'BufReadPre',
    'BufNewFile',
  },
  opts = {
    notify_on_error = false,
    formatters_by_ft = {
      javascript = { { 'prettierd', 'biome' } },
      typescript = { { 'prettierd', 'biome' } },
      javascriptreact = { { 'prettierd', 'biome' } },
      typescriptreact = { { 'prettierd', 'biome' } },
      css = { { 'prettierd', 'biome' } },
      tailwindcss = { { 'prettierd', 'biome' } },
      html = { { 'prettierd', 'biome' } },
      json = { { 'prettierd', 'biome' } },
      yaml = { { 'prettierd', 'biome' } },
      markdown = { { 'prettierd', 'biome' } },
      lua = { { 'stylua' } },
      toml = { 'taplo' },
      cs = { 'csharpier' },
    },
    format_on_save = {
      lsp_fallback = true,
      async = false,
      timeout_ms = 500,
    },
  },
}
