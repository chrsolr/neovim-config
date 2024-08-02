local options = {
  notify_on_error = true,

  format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 500,
    lsp_fallback = true,
  },

  formatters_by_ft = {
    html = { "prettierd", stop_after_first = true },
    css = { "prettierd", stop_after_first = true },
    lua = { "stylua", stop_after_first = true },
    toml = { "taplo" },
    cs = { "csharpier" },
    sql = { "sql_formatter" },
    ["_"] = { "trim_whitespace" },
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
