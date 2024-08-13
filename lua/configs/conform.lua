local options = {
  notify_on_error = true,

  format_on_save = {
    timeout_ms = 500,
    lsp_fallback = true,
  },

  formatters_by_ft = {
    javascript = { "biome", "prettierd", stop_after_first = true },
    typescript = { "biome", "prettierd", stop_after_first = true },
    javascriptreact = { "biome", "prettierd", stop_after_first = true },
    typescriptreact = { "biome", "prettierd", stop_after_first = true },
    json = { "prettierd" },
    html = { "prettierd" },
    yaml = { "prettierd" },
    css = { "prettierd" },
    lua = { "stylua" },
    toml = { "taplo" },
    cs = { "csharpier" },
    sql = { "sql_formatter" },
  },

  formatters = {
    sql_formatter = {
      command = "sql_formatter",
      stdin = true,
      args = {
        "-c",
        '{ "expressionWidth": 81, "tabWidth": 2, "keywordCase": "upper", "language": "postgresql" }',
      },
    },
  },
}

return options
